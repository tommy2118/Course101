VALID_CHOICES = %w(rock paper scissors lizard Spock).freeze

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

def name_winner(player, computer)
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
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  declare_winner = false
  round = 1
  player_wins = 0
  computer_wins = 0
  tie_games = 0

  loop do
    prompt("Round: #{round}")
    prompt("Player Wins: #{player_wins}")
    prompt("Computer Wins: #{computer_wins}")
    prompt("Tie Games: #{tie_games}")

    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = gets.chomp

      break if VALID_CHOICES.include?(choice)
      prompt("That's not a valid choice.")
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_result(choice, computer_choice)

    if name_winner(choice, computer_choice) == "player"
      player_wins += 1
      prompt("Player takes the round")
    elsif name_winner(choice, computer_choice) == "computer"
      computer_wins += 1
      prompt("Computer takes the round")
    else
      tie_games += 1
    end

    round += 1
    if player_wins == 5 || computer_wins == 5
      declare_winner = true
      prompt("That's game!")
    end

    break if declare_winner
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
