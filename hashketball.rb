# Write your code here!
require "pry"
def game_hash
    game_hash=Hash.new
    game_hash[:home] = {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => []
    }
    game_hash[:home][:players]<< Hash[
      player_name: "Alan Anderson",
      number: 0,
      shoe: 16,
      points: 22,
      rebounds: 12,
      assists: 12,
      steals: 3,
      blocks: 1,
      slam_dunks: 1
    ]
    game_hash[:home][:players]<< Hash[
        player_name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      ]
      game_hash[:home][:players]<< Hash[
        player_name: "Brook Lopez",
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      ]
      game_hash[:home][:players]<< Hash[
        player_name: "Mason Plumlee",
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      ]
      game_hash[:home][:players]<< Hash[
        player_name: "Jason Terry",
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      ]
    #   binding.pry
    game_hash[:away] = { 
        :team_name => "Charlotte Hornets", 
        :colors => ["Turquoise", "Purple"], 
        :players => []
    }
    game_hash[:away][:players]<< Hash[
        player_name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      ]
      game_hash[:away][:players]<< Hash[
        player_name: "Bismack Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10
      ]
      game_hash[:away][:players]<< Hash[
        player_name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks:5 
      ]
      game_hash[:away][:players]<< Hash[
        player_name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks:0
      ]
      game_hash[:away][:players]<< Hash[
        player_name: "Kemba Walker",
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks:12
      ]
      
game_hash
end

def hash_of_player_info(player) 
    game_hash[:away][:players].each do |hash|
       if hash[:player_name] == player
            return hash
       end
    end
    game_hash[:home][:players].each do |hash|
        if hash[:player_name] == player
            return hash
        end
    end
end

def num_points_scored (player)
  player_info = hash_of_player_info(player)
    if player_info !=nil 
        # binding.pry
        return player_info[:points] 
    end
end

def shoe_size (player)
    player_info = hash_of_player_info(player)
      if player_info !=nil 
          # binding.pry
          return player_info[:shoe] 
      end
end

def team_colors(team)
    # binding.pry
    if game_hash[:away][:team_name] == team
        return game_hash[:away][:colors]
    elsif game_hash[:home][:team_name]== team
        return game_hash[:home][:colors]
    end    
end

def team_names
    teams=Array.new
    teams << game_hash[:home][:team_name]
    teams << game_hash[:away][:team_name]
    # binding.pry
    teams
end

def player_numbers (team)
    if team == game_hash[:home][:team_name]
        players = game_hash[:home][:players]
        # binding.pry
        players.map{|hsh| hsh[:number]}
        
    elsif team == game_hash[:away][:team_name]
        players = game_hash[:away][:players]
        # binding.pry
        players.map{|hsh| hsh[:number]}
       
    end
end

def player_stats(player)
   player_stats= hash_of_player_info(player)
   player_stats.delete (:player_name)
   player_stats
end

def big_shoe_rebounds
    player_max_feet = game_hash[:home][:players].max_by{ |player_hsh|
     player_hsh[:shoe] 
}
    player_max_shoe= game_hash[:away][:players].max_by{ |player_hsh|
    player_hsh[:shoe] 
}    
    if player_max_shoe[:shoe]> player_max_feet[:shoe]
        return player_max_shoe[:rebounds]
    else
        return player_max_feet[:rebounds]
    end
# binding.pry
end

def most_points_scored
    player_most_score = game_hash[:home][:players].max_by{|player|
    player[:points]
}
    player_most_points = game_hash[:away][:players].max_by{|player|
    player[:points]
}
    if player_most_score[:points]>player_most_points[:points]
        return player_most_score[:player_name]
    else
        return player_most_points[:player_name]
    end
end

def winning_team
    home_players = 0
    home_total_score = 0
    while home_players < game_hash[:home][:players].length do 
        home_total_score += game_hash[:home][:players][home_players][:points]
        home_players +=1
    end
    away_players = 0
    away_total_score = 0
    while away_players < game_hash[:away][:players].length do 
        away_total_score += game_hash[:away][:players][away_players][:points]
        away_players +=1
    end
    if home_total_score>away_total_score
        return game_hash[:home][:team_name]
    else
        return game_hash[:away][:team_name]
    end
end

def player_with_longest_name
    player_most_letter = game_hash[:home][:players].max_by{|player|
    player[:player_name].length
}
    away_most_letter = game_hash[:away][:players].max_by{|player|
    player[:player_name].length
}
    if player_most_letter[:player_name].length>away_most_letter[:player_name].length
        return player_most_letter[:player_name]
    else
        return away_most_letter[:player_name]
    end
end 
def long_name_steals_a_ton?
    player = player_with_longest_name
    home_most_steal = game_hash[:home][:players].max_by{|player|
    player[:steals]
}
    away_most_steal = game_hash[:away][:players].max_by{|player|
    player[:steals]
}
    if home_most_steal[:steals] > away_most_steal[:steals]
        if home_most_steal[:player_name] == player
            return true
        end
    else
        if away_most_steal[:player_name] == player 
            return true
        end
    end
end 
