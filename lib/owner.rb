require 'pry'

class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @buy_pet = {:cat => [], :dog => []}
  end

  def name
    @name
  end

  def say_species
    ("I am a " + @species + ".")
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
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
    @buy_pet[:cat] << Cat.new(name, self)
  end

  def buy_dog(name)
    @buy_pet[:dog] << Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each do |walk|
      walk.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.each do |feed|
      feed.mood = "happy"
    end
  end

#REFACTOR THIS!!!
  def sell_pets
    dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
