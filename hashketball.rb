def game_hash
  game_hash = {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black','White'],
      :players => [{:player_name => 'Alan Anderson', :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1}, {:player_name =>"Reggie Evans", :number =>30, :shoe =>14, :points =>12, :rebounds =>12, :assists =>12, :steals =>12, :blocks =>12, :slam_dunks =>7}, {:player_name =>"Brook Lopez", :number =>11, :shoe =>17, :points =>17, :rebounds =>19, :assists =>10, :steals =>3, :blocks =>1, :slam_dunks =>15}, {:player_name =>"Mason Plumlee", :number =>1, :shoe =>19, :points =>26, :rebounds =>11, :assists =>6, :steals =>3, :blocks =>8, :slam_dunks =>5}, {:player_name =>"Jason Terry", :number =>31, :shoe =>15, :points =>19, :rebounds =>2, :assists =>2, :steals =>4, :blocks =>11, :slam_dunks =>1}]
    },
    :away => {:team_name => 'Charlotte Hornets',
      :colors => ['Turquoise', 'Purple'],
      :players => [{:player_name =>"Jeff Adrien", :number =>4, :shoe =>18, :points =>10, :rebounds =>1, :assists =>1, :steals =>2, :blocks =>7, :slam_dunks =>2}, {:player_name =>"Bismack Biyombo", :number =>0, :shoe =>16, :points =>12, :rebounds =>4, :assists =>7, :steals =>22, :blocks =>15, :slam_dunks =>10}, {:player_name =>"DeSagna Diop", :number =>2, :shoe =>14, :points =>24, :rebounds =>12, :assists =>12, :steals =>4, :blocks =>5, :slam_dunks =>5}, {:player_name =>"Ben Gordon", :number =>8, :shoe =>15, :points =>33, :rebounds =>3, :assists =>2, :steals =>1, :blocks =>1, :slam_dunks =>0},{:player_name =>"Kemba Walker", :number =>33, :shoe =>15, :points =>6, :rebounds =>12, :assists =>12, :steals =>7, :blocks =>5, :slam_dunks =>12}]
    }
  }
end

def num_points_scored(player)
  playerinfo = game_hash[:home][:players].concat(game_hash[:away][:players])
  i=0
  while i<playerinfo.length do
    if playerinfo[i].value?(player)
      points_scored = playerinfo[i][:points]
    end
    i+=1
  end
  return points_scored
end

def shoe_size(player)
  playerinfo = game_hash[:home][:players].concat(game_hash[:away][:players])
  i=0
  while i<playerinfo.length do
    if playerinfo[i].value?(player)
      shoe_size = playerinfo[i][:shoe]
    end
    i+=1
  end
  return shoe_size
end

def team_colors(team)
  name_to_colors = {'Brooklyn Nets' => ['Black','White'], 'Charlotte Hornets' => ['Turquoise', 'Purple']}
  colors = name_to_colors[team] 
end

def team_names 
  return ['Brooklyn Nets', 'Charlotte Hornets']
end

def player_numbers(team)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  home_numbers = []
  away_numbers = []
  i=0
  while i < home_players.length do 
    home_numbers << home_players[i][:number]
    away_numbers << away_players[i][:number]
    i+=1
  end
   player_numbers = {'Brooklyn Nets' => home_numbers, 'Charlotte Hornets' => away_numbers}
   player_numbers[team]
end

def player_stats(player)
  playerinfo = game_hash[:home][:players].concat(game_hash[:away][:players])
  i=0
  while i<playerinfo.length do
    if playerinfo[i].value?(player)
      player_info = playerinfo[i]
    end
    i+=1
  end
  player_info.delete(:player_name)
  player_info
end

def big_shoe_rebounds
  playerinfo = game_hash[:home][:players].concat(game_hash[:away][:players])
  shoe_sizes = []
  rebounds =[]
  i=0 
  while i<playerinfo.length do 
    shoe_sizes << playerinfo[i][:shoe]
    rebounds << playerinfo[i][:rebounds]
    i+=1
  end 
  rebounds[shoe_sizes.index(shoe_sizes.max)]
end

def most_points_scored
  playerinfo = game_hash[:home][:players].concat(game_hash[:away][:players])
  points = []
  names =[]
  i=0 
  while i<playerinfo.length do 
    names << playerinfo[i][:player_name]
    points << playerinfo[i][:points]
    i+=1
  end 
  names[points.index(points.max)]
end

def winning_team
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  home_p = []
  away_p = []
  i=0
  while i < home_players.length do 
    home_p << home_players[i][:points]
    away_p << away_players[i][:points]
    i+=1
  end
  totals=[home_p.sum, away_p.sum]
  teams = ['Brooklyn Nets','Charlotte Hornets']
  teams[totals.index(totals.max)]
end

def player_with_longest_name
  playerinfo = game_hash[:home][:players].concat(game_hash[:away][:players])
  name_lengths = []
  names =[]
  i=0 
  while i<playerinfo.length do 
    names << playerinfo[i][:player_name]
    name_lengths << playerinfo[i][:player_name].length
    i+=1
  end 
  player_with_longest_name = names[name_lengths.index(name_lengths.max)]
  player_with_longest_name
end

def long_name_steals_a_ton?
  playerinfo = game_hash[:home][:players].concat(game_hash[:away][:players])
  steals =[]
  names=[]
  i=0 
  while i<playerinfo.length do 
    steals << playerinfo[i][:steals]
    names << playerinfo[i][:player_name]
    i+=1
  end 
  if player_with_longest_name == names[steals.index(steals.max)]
    answer = true 
  else false
  end 
  return answer
end






