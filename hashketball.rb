# Write your code here!

def game_hash
  hash={
    :home=>{
      :team_name=>"Brooklyn Nets",
      :colors=>["Black", "White"],
      :players=>[
        {
          :player_name=>"Alan Anderson",
          :number=>0,
          :shoe=>16,  
          :points=>22,
          :rebounds=>12,
          :assists=>12,
          :steals=>3,
          :blocks=>1,
          :slam_dunks=>1
        },
         {
          :player_name=>"Reggie Evans",
          :number=>30,
          :shoe=>14,  
          :points=>12,
          :rebounds=>12,
          :assists=>12,
          :steals=>12,
          :blocks=>12,
          :slam_dunks=>7
        },
        {
          :player_name=>"Brook Lopez",
          :number=>11,
          :shoe=>17,  
          :points=>17,
          :rebounds=>19,
          :assists=>10,
          :steals=>3,
          :blocks=>1,
          :slam_dunks=>15
        },
          {
          :player_name=> "Mason Plumlee",
          :number=>1,
          :shoe=>19,  
          :points=>26,
          :rebounds=>11,
          :assists=>6,
          :steals=>3,
          :blocks=>8,
          :slam_dunks=>5
        },
        {
          :player_name=>"Jason Terry",
          :number=>31,
          :shoe=>15,  
          :points=>19,
          :rebounds=>2,
          :assists=>2,
          :steals=>4,
          :blocks=>11,
          :slam_dunks=>1
        }
      ]
      
    },
    :away=>{
      :team_name=>"Charlotte Hornets",
      :colors=>["Turquoise","Purple"],
      :players=>[
        {
          :player_name=>"Jeff Adrien",
          :number=>4,
          :shoe=>18,  
          :points=>10,
          :rebounds=>1,
          :assists=>1,
          :steals=>2,
          :blocks=>7,
          :slam_dunks=>2
        },
         {
          :player_name=>"Bismack Biyombo",
          :number=>0,
          :shoe=>16,  
          :points=>12,
          :rebounds=>4,
          :assists=>7,
          :steals=>22,
          :blocks=>15,
          :slam_dunks=>10
        },
        {
          :player_name=>"DeSagna Diop",
          :number=>2,
          :shoe=>14,  
          :points=>24,
          :rebounds=>12,
          :assists=>12,
          :steals=>4,
          :blocks=>5,
          :slam_dunks=>5
        },
        {
          :player_name=>"Ben Gordon",
          :number=>8,
          :shoe=>15,  
          :points=>33,
          :rebounds=>3,
          :assists=>2,
          :steals=>1,
          :blocks=>1,
          :slam_dunks=>0
        },
        {
          :player_name=>"Kemba Walker",
          :number=>33,
          :shoe=>15,  
          :points=>6,
          :rebounds=>12,
          :assists=>12,
          :steals=>7,
          :blocks=>5,
          :slam_dunks=>12
        }
      ]
    }
  }
end

def find_player(name)
  game_data=game_hash
  player = game_data[:home][:players].detect {|stats| stats[:player_name]==name}
    if player==nil
      player= game_data[:away][:players].detect {|stats| stats[:player_name]==name}
    end
  return player 
end

def num_points_scored(name)
  player=find_player(name)
  return player[:points]
end

def shoe_size(name)
  player=find_player(name)
  return player[:shoe]
end
  
def team_colors(team_name)
  game_data=game_hash
 if game_data[:home][:team_name]==team_name
   return game_data[:home][:colors]
 end
 return game_data[:away][:colors]
end

def team_names
  game_data=game_hash
  array=[]
  game_data.each{|key,value|
    array.push(value[:team_name])
  }
return array
end
  
def player_numbers(team_name)
  game_data=game_hash
  array=[]
  game_data.each{|key,value|
  if value[:team_name]==team_name
    value[:players].each {|player|
      array.push(player[:number])
    }
  end
  }
  return array
end

def player_stats(name)
  game_data=game_hash
  player=find_player(name)
  player.delete(:player_name)
  return player
end

def big_shoe_rebounds
  game_data=game_hash
  largest_shoe=game_data[:home][:players][0]
  game_data[:home][:players].each{|player|
  if largest_shoe[:shoe]<=player[:shoe]
    largest_shoe=player
  end
  }
  game_data[:away][:players].each{|player|
  if largest_shoe[:shoe]<=player[:shoe]
    largest_shoe=player
  end
  }
  return largest_shoe[:rebounds]
end
  
  
  #BONUS 
  
  
def most_points_scored
  game_data=game_hash
  most_points=game_data[:home][:players][0]
  game_hash[:home][:players].each{|player|
  if most_points[:points]<=player[:points]
    most_points=player
end
}
most_points=game_data[:away][:players][0]
  game_hash[:away][:players].each{|player|
  if most_points[:points]<=player[:points]
    most_points=player
end
}
return most_points[:player_name]
end

def winning_team
  game_data=game_hash
  team1=0;
  team2=0;
  points_team1=game_data[:home][:players]
  points_team2=game_data[:away][:players]
  points_team1.each{|player|
    team1+=player[:points]
  }
  points_team2.each{|player|
    team2+=player[:points]
  }
  if team1>team2
    return game_data[:home][:team_name]
  else 
    return game_data[:away][:team_name]
  end
end
  
def player_with_longest_name
  game_data=game_hash
  longest_name=game_data[:home][:players][0]
  game_hash[:home][:players].each{|player|
  if longest_name[:player_name].length <=player[:player_name].length
    longest_name=player
end
}
longest_name=game_data[:away][:players][0]
  game_hash[:away][:players].each{|player|
  if longest_name[:player_name].length<=player[:player_name].length
    longest_name=player
end
}
return longest_name[:player_name]
end
  
def long_name_steals_a_ton?
  game_data=game_hash
  longest_name=player_with_longest_name
  stealing_most=game_data[:home][:players][0]
  game_data[:home][:players].each{|player|
  if stealing_most[:steals]<=player[:steals]
    stealing_most=player
  end
  }
   stealing_most=game_data[:away][:players][0]
  game_data[:away][:players].each{|player|
  if stealing_most[:steals]<=player[:steals]
    stealing_most=player
  end
  }
  return stealing_most[:player_name]==longest_name
end