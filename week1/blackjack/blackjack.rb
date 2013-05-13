# ruby F:\github\helloruby\week1\blackjack\blackjack.rb

# Interactive command line blackjack game.

def calculate_total(cards) 
  # [['Hearts', '2'], ['Spades', 'Jack'], ...]
  total = 0
  arr = cards.map { |e| e[1] }

  arr.each do |card|
    if card == "Ace"
      total += 11
    elsif card.to_i == 0 # Jack, Queen, King
      total += 10
    else
      total += card.to_i
    end
  end

  # correct for Aces
  arr.select { |e| e == "Ace" }.count.times do
    total -= 10 if total > 21
  end

  total
end

def create_deck(number_of_decks)
  suits = ['Hearts', 'Diamonds', 'Spades', 'Club']
  cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queue', 'King', 'Ace']

  deck = suits.product(cards) * number_of_decks
  deck.shuffle!
end

puts "Welcome to Blackjack!"
print "First, tell me what your name is? "
name = gets.chomp.downcase.capitalize

puts "Hello #{name}, welcome to Blackjack world! "
puts ""

deck = create_deck(4)
game_continued = true

while game_continued
  if deck.count < 52
    puts "=> Shuffling the deck..."
    deck = create_deck(4)
    sleep(1)
  end

  # Deal Cards
  winner = nil
  player_cards = []
  dealer_cards = []

  player_cards << deck.pop
  dealer_cards << deck.pop
  player_cards << deck.pop
  dealer_cards << deck.pop

  puts "=> Cards dealt. There are now #{deck.count} cards in the deck."

  dealer_total = calculate_total(dealer_cards)
  player_total = calculate_total(player_cards)

  # Show Cards
  puts "=> Dealer is showing '#{dealer_cards[1].reverse.join(' of ')}'"

  print "=> You have: '#{player_cards[0].reverse.join(' of ')}' and '#{player_cards[1].reverse.join(' of ')}'"
  puts ", for a total of: #{player_total}"

  # player turn
  if player_total == dealer_total && player_total == 21
    puts "**** Oh, you and dealer have hit blackjack. It's tie! ****"
    winner = "NIL"
  elsif player_total == 21
    puts "**** Congratulations! You has hit blackjack. You win! ****"
    winner = "PLAYER"
  elsif dealer_total == 21
    puts "**** Sorry #{name}, dealer has hit blackjack. You lose! *****"
    winner = "DEALER"
  end

  while player_total < 21
    puts ""
    print "What would you like to do 1) hit 2) stay ? "
    hit_or_stay = gets.chomp

    if !['1', '2'].include?(hit_or_stay)
      puts "Error: You must enter 1 or 2"
      next
    end

    if hit_or_stay == '2'
      puts "You choose stay! You total is #{player_total}"
      break
    end

    # hit
    new_card = deck.pop
    puts "=> There are now #{deck.count} cards in the deck."
    puts "=> Dealing new card to you: '#{new_card.reverse.join(' of ')}'"
    player_cards << new_card
    player_total = calculate_total(player_cards)
    puts "=> You total is now: #{player_total}"

    if player_total == 21
      puts "**** Congratulations! You has hit blackjack. You win! ****"
      winner = "PLAYER"
    elsif player_total > 21
      puts "**** Sorry #{name}, you busted. You lose! ****"
      winner = "DEALER"
    end
  end

  # Show dealer's cards
  if !winner
    puts ""
    print "=> Dealer has: '#{dealer_cards[0].reverse.join(' of ')}' and '#{dealer_cards[1].reverse.join(' of ')}'"
    puts ", for a total of: #{dealer_total}"
  end

  # Dealer turn
  if dealer_total == 21
    puts "**** Sorry #{name}, dealer has hit blackjack. You lose! ****"
    winner = "DEALER"
  end

  while !winner && dealer_total < 17 # auto hit
    puts ""
    puts "=> Dealer auto hits..."
    new_card = deck.pop
    puts "=> There are now #{deck.count} cards in the deck."
    puts "=> Dealing new card for Dealer '#{new_card.reverse.join(' of ')}'"
    dealer_cards << new_card
    dealer_total = calculate_total(dealer_cards)
    puts "=> Dealer total is now: #{dealer_total}"

    if dealer_total == 21
      puts "**** Sorry #{name}, dealer has hit blackjack. You lose! ****"
      winner = "DEALER"
    elsif dealer_total > 21
      puts "**** Congratulations, dealer has busted. You win! ****"
      winner = "PLAYER"
    end
  end

  # Compare hands
  if !winner
    puts ""
    print "=> Dealer's Cards: "
    dealer_cards.each { |card| print "'#{card.reverse.join(' of ')}' " }
    puts ""
    print "=> Your Cards: "
    player_cards.each { |card| print "'#{card.reverse.join(' of ')}' "}
    puts ""
    if player_total > dealer_total
      puts "**** Congratulations, you win! ****"
    elsif player_total < dealer_total
      puts "**** Sorry #{name}, you lose! ****"
    else
      puts "**** Oh, you and dealer have equal totals of #{player_total}. It's tie! ****"
    end
  end

  puts ""
  print "Would you like to play again[Y/n]?"
  game_continued = false if gets.chomp.upcase[0] != 'Y'
end

puts ""
puts "Goodbye #{name}, thanks for playing!"