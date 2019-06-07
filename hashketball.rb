require 'byebug'

# Write your code here!
def game_hash
  {
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
    },
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    }
  }
end

def away_team
  game_hash.fetch(:away)
end

def home_team
  game_hash.fetch(:home)
end

def teams
  game_hash.values
end

def find_team(team)
  teams.find{|team_hash| team_hash[:team_name] == team}
end

def away_team_players
  away_team.fetch(:players)
end

def home_team_players
  home_team.fetch(:players)
end

def both_team_players
  away_team_players + home_team_players
end

def find_player(player)
  both_team_players.find do |player_hash|
    player_hash[:player_name] == player
  end
end

def num_points_scored(player)
  find_player(player).fetch(:points)
end

def shoe_size(player)
  find_player(player).fetch(:shoe)
end

def team_colors(team)
  find_team(team).fetch(:colors)
end

def team_names
  teams.map{|team| team[:team_name]}
end

def player_numbers(team)
  find_team(team).fetch(:players).map do |player_hash|
    player_hash.fetch(:number)
  end
end

def player_stats(player)
  find_player(player).filter{|k| k != :player_name}
end

def big_shoe_rebounds
  both_team_players.sort_by{|player| player[:shoe]}.last.fetch(:rebounds)
end

def most_points_scored
  both_team_players.sort_by{|player| player[:points]}.last.fetch(:player_name)
end

def winning_team
  home_score = 0
  away_score = 0

  game_hash.each do |place, team|
    team.fetch(:players).each do |player|
      if place == :away
        away_score += player.fetch(:points)
      else
        home_score += player.fetch(:points)
      end
    end
  end
  if away_score > home_score
    game_hash[:away][:team_name]
  else
    game_hash[:home][:team_name]
  end
end

def player_with_longest_name
  longest_name = ""

  both_team_players.each do |player|
    if player[:player_name].length > longest_name.length
      longest_name = player[:player_name]
    end
  end
  longest_name
end
