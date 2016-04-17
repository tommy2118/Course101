MONTHS_IN_A_YEAR = 12

def prompt(string)
  puts "=> " + string
end

def loan_term_in_months
  @term * MONTHS_IN_A_YEAR
end

def monthly_interest_rate
  (@apr / 100) / MONTHS_IN_A_YEAR
end

def monthly_loan_payment
  (@loan_amount * (monthly_interest_rate *
    ((1 + monthly_interest_rate)**loan_term_in_months))) /
    ((((1 + monthly_interest_rate)**loan_term_in_months) - 1))
end

loop do
  prompt("Welcome to the Loan Calculator")

  @loan_amount = ""
  loop do
    prompt("What is the total amount you are financing?")
    @loan_amount = gets.chomp.to_i
    break unless @loan_amount <= 0
    prompt("Please enter a value greater then zero")
  end

  @apr = ''
  loop do
    prompt("What is the Annual Percentage Rate(APR) of the loan?")
    @apr = gets.chomp.to_f
    break unless @apr <= 0
    prompt("Please enter a value greater then zero")
  end

  @term = ''
  loop do
    prompt("How many years do you plan on financing for?")
    @term = gets.chomp.to_i
    break unless @term <= 0
    prompt("Please enter a value greater then zero")
  end

  prompt("Your monthly intrest rate is #{monthly_interest_rate.round(5)}%.")
  prompt("Your monthly payment will be $#{monthly_loan_payment.round(2)} for #{loan_term_in_months} months.")

  prompt("Would you like to calculate another loan?")
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the Loan Calculator!")
