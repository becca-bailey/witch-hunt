class Character
  
  attr_accessor :role, :status, :name
  
  def initialize()
    @status = 'alive'
  end
  
  def kill
    @status = 'dead'
  end
    
end


class Witch < Character
  
  
end

class Villager < Character
end


class Game
  
  attr_reader :name, :role, :active_witches, :active_villagers
  
  def initialize
    @roles = ['Witch', 'Villager']
    @players = []
    @active_witches = 0
    @active_villagers = 0
  end
  
  def assign(character_names)
    witches = character_names.sample(3)
    villagers = character_names - witches
    
    witches.sample(3).each do |name|
      char = Character.new
      char.name = name
      char.role = 'witch'
      @players << char
      @active_witches += 1 
    end   
    
    villagers.each do |name|
      char = Character.new
      char.name = name
      char.role = 'villager'
      @players << char
      @active_villagers += 1
    end
  end
  
  def should_continue_game?
    @active_witches > 0 && @active_villagers > 0
  end
  
  def game_status
    @players.each do |player|
      puts "#{player.name} is a(n) #{player.role} (#{player.status

})"
    end
  end

  def fate(player_type)
    puts "What #{player_type} would you like to kill?"
    @vote = gets.chomp
    @players.each do |player|
      if @vote == player.name && player.status == 'alive'
        player.status = 'dead'
        if player.role = "witch"
          @active_witches -= 1
        elsif player.role = "villager"
          @active_villagers -= 1
        else
        end
      end
    end
    puts "It has been done."
  end  
  
  
  
  
end


game = Game.new
game.assign(["Catie", "Devin", "Dana", "Josh", "Becca", "Syema"])

while game.should_continue_game?
  game.game_status
  game.fate("villager")
  game.game_status
  game.fate("witch")
end