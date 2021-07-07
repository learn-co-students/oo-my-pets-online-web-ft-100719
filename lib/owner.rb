require "pry"

class Owner
  attr_accessor :pets, :cat, :dog
  attr_reader :name, :species

 @@all = []

  def initialize(name, species= "human")
    @name = name
    @species = species
    @@all << self
  end

  def species
    @species
  end

  def say_species
    return "I am a #{species}."
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


  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
   Dog.new(name, self)
  end

  def walk_dogs
    #binding.pry
    dogs.each do |dog|
        dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
    cat.mood = "happy"
    end
  end

  def sell_pets
    pets = cats + dogs
    pets.each do |sell|
      sell.mood = "nervous"
      sell.owner = nil
    end
 end

 def list_pets
   "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
 end

end
