require "tty-prompt"
require "ruby_figlet"
require "colorize"
require "tty-font"



class CommandLineInterface

    attr_accessor :prompt 
    attr_reader :player

   def initialize()
    @prompt = TTY::Prompt.new
   end


  


    def run 
        system "clear"
        welcome
        login_or_sign_up
        main_menu

    end

    def welcome 
        display_game_trove
        puts "Welcome to Gamers Trove"
        sleep(0.4) 
    end

    def display_game_trove 
        title = TTY::Font.new(:doom)
        puts title.write("WELCOME TO GAMERS TROVE").colorize(:magenta)
    end

    def login_or_sign_up
        puts "First time here or returning player? Enter your name!".colorize(:light_yellow)
        #player_input takes whatever you enter and sets it 
        @player_input = gets.chomp.downcase
        #1. @player stores the position within the player datatbase 
        #2. name: is a column of all names , 
        #2.  @player _input is the value were looking for that we set as a player 
        @player = Player.find_by(name: @player_input)
        if returning 
            puts "Welcome back".colorize(:light_red)
            sleep 0.4
        else 
            @player = Player.create(name: @player_input)
            # Profile.create(player_id: player.id, game_id: game.id)
            @player_id = @player.id
        end
    end

    def returning
        if Player.find_by(name: @player_input)
            @player = Player.find_by(name: @player_input)
            true 
        else 
            false
        end

        
    end

    def main_menu
        answer = prompt.select("Howdy what brings you here?") do |menu|
            menu.choice "Create Your Profile For Games"
            menu.choice "View Your Profiles"
            menu.choice "Delete Your Profiles"
            menu.choice "exit Game Trove".colorize(:red)
        end

        if answer == "Create Your Profile For Games"
            list_of_games
        elsif answer == "View Your Profiles"
            list_of_profiles 
        elsif answer == "Delete Your Profiles"
            players_profiles
        else
            exit
        end

    end

    def game_titles
        Game.all.map do |game|
        game.title 
        end
    end

    # def game_delete(word)

    # end

  


    
    def players_profiles 
        # takes all the profiles of a specific player 
        @player.profiles.map do |profile|
            {name: profile.gamer_tag, value: profile} 
        end
    end

     
     

   
    
    def list_of_games 
        game_select = prompt.select("here are your choices", game_titles) 
        newid = Game.all.find_by(title: game_select)
        puts "whats your GamerTag?"
        gtag = gets.chomp
        new_profile = Profile.create(player_id: player.id,game_id: newid.id, gamer_tag: gtag)
        
        puts "Your profile has been created!"
        # Profile.all.select do |profiles|
        #     profiles.my_games == 
            # pro_name 
        # end
    end

    def delete_profile
        prompt.select("here are your profiles", players_profiles)
    end
    
    def list_of_profiles
        profile = prompt.select("here are your profiles", players_profiles)

        if profile
            option = prompt.select("would you like to do with your profile?") do |menu|
                menu.choice "Update"
                menu.choice "Delete"
                menu.choice "main menu"
            end
            if option == "Update"
                puts "create your new GamerTag for #{profile.game.title}"
                new_tag = gets.chomp
                profile.update(gamer_tag: new_tag)
            elsif option == "Delete"
                puts "GoodBye"
                Profile.destroy(profile.id)
            else
                main_menu
            end
        end
        # main_menu
    end


  










 
end


