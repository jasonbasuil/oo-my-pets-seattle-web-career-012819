require 'pry'
class Owner

  attr_accessor :name, :pets
  attr_reader :species

  @@all = []


  def initialize(name)
    @name = name
    @pets = {:cats => [], :dogs => [], :fishes => []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def species
    @species = "human"
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    name = Fish.new(name)
    @pets[:fishes] << name
  end

  def buy_cat(name)
    name = Cat.new(name)
    @pets[:cats] << name
  end

  def buy_dog(name)
    name = Dog.new(name)
    @pets[:dogs] << name
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each do |key,value|
      value.each do |animal|
        animal.mood = 'nervous'
      end
    end
    @pets.clear
  end

  def list_pets
    number_fish = @pets[:fishes].count
    number_dogs = @pets[:dogs].count
    number_cats = @pets[:cats].count
    "I have #{number_fish} fish, #{number_dogs} dog(s), and #{number_cats} cat(s)."
  end

end
