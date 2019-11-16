#Gems: tty prompts, colorize, artii
player = []
dealer = []
new_hand_value = 0
players_turn = true
dealers_hand_value = 0
dealers_turn = true

class Card

    @@faces = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]
    @@suits = ["♥","♠","♣","♦"]
    
    def self.card_value(card)
        if card == "J" or card == "Q" or card == "K" 
            return 10
        elsif card == "A"
            return 1
        else 
            return card.to_i
        end 
    end

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
