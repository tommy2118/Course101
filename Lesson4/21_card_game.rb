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
    + "|" + card_one[0].to_s + " " * (card_one[0] == 10 ? 9 : 10) + "|" \
    + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * 5 + card_one[1] + " " * 5 + "|" + "  " + "|" + " " * 11 \
    + "|\n" + "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * (card_one[0] == 10 ? 9 : 10) + card_one[0].to_s + "|" + "  " \
    + "|" + " " * 11 + "|\n" \
    + "+" + "-" * 11 + "+" + "  " + "+" + "-" * 11 + "+"
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
    total += if card[0] == "A"
               11
             elsif card[0].to_i == 0
               10
             else
               card[0]
             end
  end
  hand.flatten.select { |value| value == "A" }.count.times do
    total -= 10 if total > 21
  end

  total
end

def busted?(hand)
  return true if total_cards(hand) > 21
end

def display_board_players_turn(players_hand, dealers_hand)
  system('clear') || system('cls')
  display_dealers_initial_hand(*dealers_hand)
  render_cards(*players_hand)
  puts "Player: #{total_cards(players_hand)}"
end

def display_board_dealers_turn(players_hand, dealers_hand)
  system('clear')
  render_cards(*dealers_hand)
  render_cards(*players_hand)
  puts "Player: #{total_cards(players_hand)}"
  puts "Dealer: #{total_cards(dealers_hand)}"
end

def set_up_game(deck, players_hand, dealers_hand)
  deal_card(deck, players_hand)
  deal_card(deck, dealers_hand)
  deal_card(deck, players_hand)
  deal_card(deck, dealers_hand)
  display_board_players_turn(players_hand, dealers_hand)
end

loop do
  players_hand = []
  dealers_hand = []
  players_answer = ''
  deck = initialize_deck
  set_up_game(deck, players_hand, dealers_hand)
  loop do
    loop do
      loop do
        prompt("Type 'h' to hit or 's' to stay")
        players_answer = gets.chomp.downcase
        break if players_answer == 'h' || players_answer == 's'
        prompt("please enter a valid selection.")
      end

      if busted?(players_hand)
        display_board_players_turn(players_hand, dealers_hand)
        puts "You busted! Game over!"
        break
      elsif players_answer == 's'
        display_board_players_turn(players_hand, dealers_hand)
        puts "You chose to stay!"
        break
      else
        deal_card(deck, players_hand)
        display_board_players_turn(players_hand, dealers_hand)
        if busted?(players_hand)
          display_board_players_turn(players_hand, dealers_hand)
          puts "You busted! Game over!"
          break
        end
      end
    end

    break if busted?(players_hand)

    loop do
      display_board_dealers_turn(players_hand, dealers_hand)
      sleep(1)
      deal_card(deck, dealers_hand) if total_cards(dealers_hand) < 17
      display_board_dealers_turn(players_hand, dealers_hand)
      break if busted?(dealers_hand) || total_cards(dealers_hand) >= 17
    end

    break
  end

  if busted?(dealers_hand) || total_cards(dealers_hand) < \
    total_cards(players_hand) && !busted?(players_hand)
    puts "Player wins!"
  elsif total_cards(players_hand) == total_cards(dealers_hand)
    puts "The hand is a push!"
  else
    puts "Dealer wins!"
  end

  answer = ''
  loop do
    prompt("Would you like to play again? 'y' or 'n'?")
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'
    puts "Please enter a valid response"
  end

  break if answer == "n"
end
puts "Thanks for playing!"
