require 'pry'

SUITS = %w(H D C S).freeze

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  values = []
  (2..10).each { |value| values << value }
  values += %w(J Q K A)
  card_deck = values.product(SUITS)
  card_deck
end

def deal_card(deck, player)
  player << deck.rotate!(rand(deck.length)).shift
end

def display_dealers_initial_hand(card_one, _card_two)
  puts ""
  puts "+" + "-" * 11 + "+" + "  " + "+" + "-" * 11 + "+\n" \
    + "|" + card_one[0].to_s + " " * 10 + "|" + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * 5 + card_one[1] + " " * 5 + "|" + "  " + "|" + " " * 11 \
    + "|\n" + "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * 10 + card_one[0].to_s + "|" + "  " + "|" + " " * 11 + "|\n" \
    + "+" + "-" * 11 + "+" + "  " + "+" + "-" * 11 + "+"
end

def display_two_card_hand(card_one, card_two)
  puts ""
  puts "+" + "-" * 11 + "+" + "  " + "+" + "-" * 11 + "+"
  puts "|" + card_one[0].to_s + " " * 10 + "|" + "  " + "|" + \
       card_two[0].to_s + " " * 10 + "|"
  puts "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|"
  puts "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|"
  puts "|" + " " * 5 + card_one[1] + " " * 5 + "|" + "  " + "|" + " " * 5 \
       + card_one[1] + " " * 5 + "|"
  puts "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|"
  puts "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|"
  puts "|" + " " * 10 + card_one[0].to_s + "|" + "  " + "|" + " " * 10 + \
       card_two[0].to_s + "|"
  puts "+" + "-" * 11 + "+" + "  " + "+" + "-" * 11 + "+"
end

def render_cards(*hand)
  part_one = []
  part_two = []
  part_three = []
  part_four = []
  part_five = []
  part_six = []
  part_seven = []
  part_eight = []
  part_nine = []

  hand.each do |card|
    part_one << "+" + "-" * 11 + "+" + "  "
    part_two << if card[0] == 10
                  "|" + card[0].to_s + " " * 9 + "|" + "  "
                else
                  "|" + card[0].to_s + " " * 10 + "|" + "  "
                end
    part_three << "|" + " " * 11 + "|" + "  "
    part_four << "|" + " " * 11 + "|" + "  "
    part_five << "|" + " " * 5 + card[1] + " " * 5 + "|" + "  "
    part_six << "|" + " " * 11 + "|" + "  "
    part_seven << "|" + " " * 11 + "|" + "  "
    part_eight << if card[0] == 10
                    "|" + " " * 9 + card[0].to_s + "|" + "  "
                  else
                    "|" + " " * 10 + card[0].to_s + "|" + "  "
                  end
    part_nine << "+" + "-" * 11 + "+" + "  "
  end

  puts part_one.join
  puts part_two.join
  puts part_three.join
  puts part_four.join
  puts part_five.join
  puts part_six.join
  puts part_seven.join
  puts part_eight.join
  puts part_nine.join
end

def total_cards(hand)
  total = 0
  hand.each do |card|
    total += if card[0] == "J" || card[0] == "Q" || card[0] == "K"
               10
             elsif
               card[0] == "A"
               11
             else
               card[0]
             end
  end
  total -= 10 if total >= 21 && hand.flatten.include?("A")
  total
end

def busted?(hand)
  total_cards(hand) > 21
end

players_hand = []
dealers_hand = []
deck = initialize_deck
deal_card(deck, players_hand)
deal_card(deck, dealers_hand)
deal_card(deck, players_hand)
deal_card(deck, dealers_hand)
display_dealers_initial_hand(*dealers_hand)
render_cards(*players_hand)
puts total_cards(players_hand)
puts busted?(players_hand)
loop do
  prompt("Type hold to stay")
  players_move = gets.chomp
  break if busted?(players_hand) || players_move == "hold"
  system('clear')
render_cards(*players_hand)
puts total_cards(players_hand)
puts busted?(players_hand)
end
