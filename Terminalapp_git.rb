#Gems: tty prompts, colorize, artii


#Creating a class called "Bank"
class Bank 
    attr_accessor :cash_on_hand, :betting
    def initialize()
        @betting = 25
        @cash_on_hand = 100
    end
    
    def betting()
        @betting 
    end
    
    def cash_on_hand()
        @cash_on_hand
    end
end

# Create a class called "Card"
class Card
    
    @@faces = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]
    @@suits = ["♥","♠","♣","♦"]

# Adding values to Jack, Queen and King 
    def self.card_value(card)
        if card == "J" or card == "Q" or card == "K" 
            return 10
        elsif card == "A"
            return 1
        else 
            return card.to_i
        end 
    end
# initiating random card faces and suits 
    def self.deal()
        face = "#{Card.faces[rand(0..11)]}"
        card = face + "#{Card.suits[rand(0..3)]}" 
        hand_value = Card.card_value(face)
        return card, hand_value
    end
    
    def self.faces
        @@faces
    end
    
    def self.suits
        @@suits
    end
end

money = Bank.new()
continue = true
while continue 
    # Creating a variable for player and dealer
    # Everytime a card is given it will be stored into the empty array
    player = []
    new_hand_value = 0
    players_turn = true
    dealer = []
    dealers_hand_value = 0
    dealers_turn = true

    # Initiates loop when Players calls (hit) another card
    while players_turn
        # Accessing Card class and retrieving a value of a card
        card, value  = Card.deal()
        player << card
        new_hand_value += value
        puts new_hand_value

        # Creating outcomes for player's cards in hand
        if new_hand_value == 21
            puts "21!!! Player one wins"
            dealers_turn = false

        elsif new_hand_value > 21
            puts "BUSTED"
            players_turn = false
            dealers_turn = false
        break
        else
        end
        p player

        # App asking player if they would like to hit or stand
        puts "Would you like to (h = hit or s = stop))"
        user_input = gets.chomp
        if user_input == "h"
            players_turn = true
        else user_input == "s"
            players_turn = false
        end
    end

    #--------- Dealer rules --------#
    # Dealer stands when card value reaches > 16
    # Dealer will lose when "busted" and Player will automatically win

    puts "Dealer's turn"
    while dealers_turn
        sleep 2
        #Dealer pulls out a card
        if dealers_hand_value < 17
            card, value = Card.deal()
            dealer << card 
            dealers_hand_value += value
            p dealer
        elsif dealers_hand_value >= 17 && dealers_hand_value <=21
            p dealers_hand_value
            dealers_turn = false
        elsif dealers_hand_value > 21
            puts "Busted"
            dealers_turn = false
        end
    end

    # Compare Player's and Dealer's hand and weigh outcome
    # If Player has the upper hand or Dealer busts, Player wins bettings
    # If Dealer has the upper hand or Player busts, Dealer wins bettings
    if new_hand_value > 21
        puts "Dealer wins"
        money.cash_on_hand -= 25
    elsif dealers_hand_value > 21
        puts "Player wins"
        money.cash_on_hand +=25
    elsif new_hand_value > dealers_hand_value
        puts "Player wins"
        money.cash_on_hand +=25
    elsif dealers_hand_value > new_hand_value
        puts "Dealer wins"
        money.cash_on_hand -= 25
    else dealers_hand_value == new_hand_value
        puts "Tie"
    end
    puts "You have #{money.cash_on_hand} left in the bank"

    #Ask player if they would like to play again
    puts "Would you like to play again?(yes/no)"
    answer = gets.chomp
    if answer == "yes"
        continue = true 
        players_turn = true
        dealers_turn = true
        if money.cash_on_hand < money.betting
            continue = false
            players_turn = false
            players_turn = false
            puts "Sorry you dont have enough money. See you next time!"
        end
    else answer == "no"
        continue = false
    end
end