# frozen_string_literal: true

# player class
class Player
  attr_accessor :name, :hand, :bank, :total, :bet

  def initialize(name, bank_roll)
    @name = name
    @hand = []
    @bank_roll = bank_roll
    @total = 0
    @bet = 0
  end

  def add_card_in_hand(card)
    card.score = 1 if card.score == 11 && @total > 11
    @total += card.score
    @hand << card
  end

  def intrdouce
    puts "I am #{@name}, I have $#{@bank_roll} left."
  end
end

# card class
class Card
  attr_accessor :value, :suit, :score

  def initialize(value, suit, score)
    @value = value
    @suit = suit
    @score = score
  end

  def show_card
    puts "#{@value}-#{@suit} (#{@score})"
  end
end

# Deck class
class Deck
  def initialize
    @values = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
    @suits = ['clubs', 'spades', 'hearts', 'diamonds']
    @cards = []
    build_deck
  end

  def build_deck
    @values.each do |value|
      if value.is_a? Integer
        score = value
      elsif value == 'A'
        score = 11
      else # J, Q, K
        score = 10
      end
      @suits.each do |suit|
        @cards << Card.new(value, suit, score)
      end
    end
    @cards.shuffle!
  end

  def deal_a_card
    random_index = rand(@cards.length)
    card = @cards[random_index]
    @cards.delete_at(random_index)
    card # returns card
  end

  def show_deck
    @cards.each(&:show_card)
  end
end

# Game class
class BlackJack
  def initialize(player_name)
    @player = Player.new(player_name, 1000)
    @player.intrdouce
    @computer = Player.new('Computer', 100_000)
    @deck = Deck.new
  end

  def play_game
    puts("Welcome to the Balck Jack #{@player.name}")
  end
end

print 'Enter your name: '
player_name = gets.chomp

new_game = BlackJack.new(player_name)
new_game.play_game