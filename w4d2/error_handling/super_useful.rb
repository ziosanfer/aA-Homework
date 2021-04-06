# PHASE 2
def convert_to_int(str)
  Integer(str)
end

# PHASE 3
class CoffeeError < StandardError
  def message
    "Ducks don't drink coffee bro. Do you have anything else?"
  end
end

class NotFruit < StandardError
  def message
    "Do you know what a fruit is?"
  end
end

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include?(maybe_fruit)
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError 
  else
    raise NotFruit 
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly duckling. :)"
  begin
    puts "You got fruit? Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => ce
    puts ce.message
    retry
  rescue NotFruit => nf
    puts nf.message
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


