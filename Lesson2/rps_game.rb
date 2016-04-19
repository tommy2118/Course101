VALID_CHOICES = { "r" => "rock",
                  "p" => "paper",
                  "s" => "scissors",
                  "l" => "lizard",
                  "S" => "Spock" }.freeze

def prompt(message)
  puts("=> #{message}")
end

def win?(player1, player2)
  (player1 == 'scissors' && player2 == 'paper') ||
    (player1 == 'paper' && player2 == 'rock') ||
    (player1 == 'rock' && player2 == 'lizard') ||
    (player1 == 'lizard' && player2 == 'Spock') ||
    (player1 == 'Spock' && player2 == 'scissors') ||
    (player1 == 'scissors' && player2 == 'lizard') ||
    (player1 == 'lizard' && player2 == 'paper') ||
    (player1 == 'paper' && player2 == 'Spock') ||
    (player1 == 'Spock' && player2 == 'rock') ||
    (player1 == 'rock' && player2 == 'scissors')
end

def declare_round_winner(player, computer)
  if win?(player, computer)
    "player"
  elsif win?(computer, player)
    "computer"
  else
    "tie"
  end
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won the round!")
  elsif win?(computer, player)
    prompt("Computer won the round!")
  else
    prompt("It's a tie!")
  end
end

loop do
  declare_game_winner = false
  round = 1
  player_wins = 0
  computer_wins = 0
  tie_games = 0

  loop do
    puts "=" * 55
    prompt("Round: #{round}")
    prompt("Player Wins: #{player_wins}")
    prompt("Computer Wins: #{computer_wins}")
    prompt("Tie Games: #{tie_games}")

    choice = ''
    loop do
      prompt("Choose one by selecting the first character in the name: #{VALID_CHOICES.values.join(', ')}")
      choice = VALID_CHOICES[gets.chomp]

      begin
        break if VALID_CHOICES.keys.each { |key| key.include?(choice) }
      rescue TypeError
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.values.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_result(choice, computer_choice)

    if declare_round_winner(choice, computer_choice) == "player"
      player_wins += 1
    elsif declare_round_winner(choice, computer_choice) == "computer"
      computer_wins += 1
    else
      tie_games += 1
    end

    round += 1
    if player_wins == 5 || computer_wins == 5
      declare_game_winner = true
      prompt("That's game!")
      if player_wins == 5
        prompt("You won the game!")
      else
        prompt("The Computer won the game.")
      end
    end

    break if declare_game_winner
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
