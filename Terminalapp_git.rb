require 'colorize'


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

# Accessing our class variables of faces and suits and initiating random cards
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

puts "Let's begin the game!"
sleep 3

# Object created
money = Bank.new()

# The app loops if Player chooses to play the game again
continue = true
while continue 
# Creating variables for player and dealer
# Everytime a card is called it will be stored into an empty array and displayed in terminal
player = []
new_hand_value = 0
players_turn = true
dealer = []
dealers_hand_value = 0
dealers_turn = true

## Player rules
# Player recieves two cards
# Accessing Card class and retrieving values of card
    2.times do
    card, value = Card.deal()
    player << card
    new_hand_value += value
    p player 
    end 
    
    while players_turn
# App asking player if they would like to hit or stand
        puts "Would you like to (h = hit or s = stop))"
        user_input = gets.chomp
        if user_input == "h"
            players_turn = true  
            card, value  = Card.deal()
            player << card
            new_hand_value += value
                p player
            if new_hand_value == 21
                puts "21!!!"
            break
            elsif new_hand_value > 21
                puts "BUSTED".colorize(:red)
                players_turn = false
                dealers_turn = false
            else
            end
        else user_input == "s"
            players_turn = false
        end
    end

## Dealer rules
# Dealer stands when card value reaches > 16
# Dealer will lose when "busted" and Player will automatically win

    puts "Dealer's turn"
    while dealers_turn
        sleep 1
#Dealer pulls out cards
        if dealers_hand_value < 17
            card, value = Card.deal()
            dealer << card 
            dealers_hand_value += value
            p dealer
        elsif dealers_hand_value >= 17 && dealers_hand_value <=21
            p dealers_hand_value
            dealers_turn = false
        elsif dealers_hand_value > 21
            puts "BUSTED".colorize(:red)
            dealers_turn = false
        end
    end

# Compare Player's and Dealer's hand and weigh outcome
# If Player has the upper hand or Dealer busts, Player wins bettings
# If Dealer has the upper hand or Player busts, Dealer wins bettings
    if new_hand_value > 21
        puts "Dealer wins".colorize(:blue)
        money.cash_on_hand -= 25
    elsif dealers_hand_value > 21
        puts "Player wins".colorize(:blue)
        money.cash_on_hand +=25
    elsif new_hand_value > dealers_hand_value
        puts "Player wins".colorize(:blue)
        money.cash_on_hand +=25
    elsif dealers_hand_value > new_hand_value
        puts "Dealer wins".colorize(:blue)
        money.cash_on_hand -= 25
    else dealers_hand_value == new_hand_value
        puts "Tie".colorize(:blue)
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