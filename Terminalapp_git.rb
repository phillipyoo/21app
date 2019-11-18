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

# Creating a variable for player
# Everytime a card is given it will be stored into the empty array
player = []
new_hand_value = 0
players_turn = true

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

else
end

p player
    