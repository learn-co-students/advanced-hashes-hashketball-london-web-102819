def game_hash
  hash = {}
  hash[:home] = {team_name: "Brooklyn Nets", colors: ["Black", "White"], players: Array.new(5){Hash.new}}
  hash[:away] = {team_name: "Charlotte Hornets", colors: ["Turquoise", "Purple"], players: Array.new(5){Hash.new}}

  hash[:home][:players][0][:name] = "Alan Anderson"
  hash[:home][:players][0][:number] = 0
  hash[:home][:players][0][:shoe] = 16
  hash[:home][:players][0][:points] = 22
  hash[:home][:players][0][:rebounds] = 12
  hash[:home][:players][0][:assists] = 12
  hash[:home][:players][0][:steals] = 3
  hash[:home][:players][0][:blocks] = 1
  hash[:home][:players][0][:slam_dunks] = 1

  hash[:home][:players][1][:name] = "Reggie Evans"
  hash[:home][:players][1][:number] = 30
  hash[:home][:players][1][:shoe] = 14
  hash[:home][:players][1][:points] = 12
  hash[:home][:players][1][:rebounds] = 12
  hash[:home][:players][1][:assists] = 12
  hash[:home][:players][1][:steals] = 12
  hash[:home][:players][1][:blocks] = 12
  hash[:home][:players][1][:slam_dunks] = 7

  hash[:home][:players][2][:name] = "Brook Lopez"
  hash[:home][:players][2][:number] = 11
  hash[:home][:players][2][:shoe] = 17
  hash[:home][:players][2][:points] = 17
  hash[:home][:players][2][:rebounds] = 19
  hash[:home][:players][2][:assists] = 10
  hash[:home][:players][2][:steals] = 3
  hash[:home][:players][2][:blocks] = 1
  hash[:home][:players][2][:slam_dunks] = 15

  hash[:home][:players][3][:name] = "Mason Plumlee"
  hash[:home][:players][3][:number] = 1
  hash[:home][:players][3][:shoe] = 19
  hash[:home][:players][3][:points] = 26
  hash[:home][:players][3][:rebounds] = 11
  hash[:home][:players][3][:assists] = 6
  hash[:home][:players][3][:steals] = 3
  hash[:home][:players][3][:blocks] = 8
  hash[:home][:players][3][:slam_dunks] = 5

  hash[:home][:players][4][:name] = "Jason Terry"
  hash[:home][:players][4][:number] = 31
  hash[:home][:players][4][:shoe] = 15
  hash[:home][:players][4][:points] = 19
  hash[:home][:players][4][:rebounds] = 2
  hash[:home][:players][4][:assists] = 2
  hash[:home][:players][4][:steals] = 4
  hash[:home][:players][4][:blocks] = 11
  hash[:home][:players][4][:slam_dunks] = 1

  hash[:away][:players][0][:name] = "Jeff Adrien"
  hash[:away][:players][0][:number] = 4
  hash[:away][:players][0][:shoe] = 18
  hash[:away][:players][0][:points] = 10
  hash[:away][:players][0][:rebounds] = 1
  hash[:away][:players][0][:assists] = 1
  hash[:away][:players][0][:steals] = 2
  hash[:away][:players][0][:blocks] = 7
  hash[:away][:players][0][:slam_dunks] = 2

  hash[:away][:players][1][:name] = "Bismack Biyombo"
  hash[:away][:players][1][:number] = 0
  hash[:away][:players][1][:shoe] = 16
  hash[:away][:players][1][:points] = 12
  hash[:away][:players][1][:rebounds] = 4
  hash[:away][:players][1][:assists] = 7
  hash[:away][:players][1][:steals] = 22
  hash[:away][:players][1][:blocks] = 15
  hash[:away][:players][1][:slam_dunks] = 10

  hash[:away][:players][2][:name] = "DeSagna Diop"
  hash[:away][:players][2][:number] = 2
  hash[:away][:players][2][:shoe] = 14
  hash[:away][:players][2][:points] = 24
  hash[:away][:players][2][:rebounds] = 12
  hash[:away][:players][2][:assists] = 12
  hash[:away][:players][2][:steals] = 4
  hash[:away][:players][2][:blocks] = 5
  hash[:away][:players][2][:slam_dunks] = 5

  hash[:away][:players][3][:name] = "Ben Gordon"
  hash[:away][:players][3][:number] = 8
  hash[:away][:players][3][:shoe] = 15
  hash[:away][:players][3][:points] = 33
  hash[:away][:players][3][:rebounds] = 3
  hash[:away][:players][3][:assists] = 2
  hash[:away][:players][3][:steals] = 1
  hash[:away][:players][3][:blocks] = 1
  hash[:away][:players][3][:slam_dunks] = 0

  hash[:away][:players][4][:name] = "Kemba Walker"
  hash[:away][:players][4][:number] = 33
  hash[:away][:players][4][:shoe] = 15
  hash[:away][:players][4][:points] = 6
  hash[:away][:players][4][:rebounds] = 12
  hash[:away][:players][4][:assists] = 12
  hash[:away][:players][4][:steals] = 7
  hash[:away][:players][4][:blocks] = 5
  hash[:away][:players][4][:slam_dunks] = 12

 hash
end

def num_points_scored(player_name)
  player_hash = game_hash[:home][:players] + game_hash[:away][:players]

  player_hash.each do |player|
    if player[:name] == player_name
      return player[:points]
    end
  end
end

def shoe_size(player_name)
  player_hash = game_hash[:home][:players] + game_hash[:away][:players]

  player_hash.each do |player|
    if player[:name] == player_name
      return player[:shoe]
    end
  end
end

def team_colors(team_name)
  if team_name == game_hash[:home][:team_name]
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end
end

def team_names
  p [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team_name)
  jersey_numbers = []
  if team_name == game_hash[:home][:team_name]
    game_hash[:home][:players].each do |player|
      jersey_numbers.push(player[:number])
    end
  else
    game_hash[:away][:players].each do |player|
      jersey_numbers.push(player[:number])
    end
  end
  return jersey_numbers
end

def player_stats(player_name)
  player_hash = game_hash[:home][:players] + game_hash[:away][:players]

  player_hash.each do |player|
    if player[:name] == player_name
      player.delete(:name)
      return player
    end

  end

end

def big_shoe_rebounds
  max_shoe_size = 0
  rebound = 0
  player_hash = game_hash[:home][:players] + game_hash[:away][:players]

  player_hash.each do |player|
    if player[:shoe] > max_shoe_size
      max_shoe_size = player[:shoe]
      rebound = player[:rebounds]
    end
  end
  rebound
end

def winning_team
  home_total = 0
  away_total = 0

  game_hash[:home][:players].each do |player|
    home_total += player[:points]
  end

  game_hash[:away][:players].each do |player|
    away_total += player[:points]
  end

  return game_hash[:home][:team_name] if home_total > away_total
  return away_total

end

def most_points_scored
  max_points = 0
  name = ""
  player_hash = game_hash[:home][:players] + game_hash[:away][:players]

  player_hash.each do |player|
    if player[:points] > max_points
      max_points = player[:points]
      name = player[:name]
    end
  end
  name
end

def player_with_longest_name
  longest_name_length = 0
  longest_name = ""
  player_hash = game_hash[:home][:players] + game_hash[:away][:players]

  player_hash.each do |player|
    if player[:name].length > longest_name_length
      longest_name_length = player[:name].length
      longest_name = player[:name]
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  max_steals = 0
  max_steals_player = ""
  player_hash = game_hash[:home][:players] + game_hash[:away][:players]

  player_hash.each do |player|
    if player[:steals] > max_steals
      max_steals = player[:steals]
      max_steals_player = player[:name]
    end
  end

  return true if player_with_longest_name == max_steals_player
end
