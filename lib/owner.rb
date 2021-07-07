require 'pry'
class Owner
  
  attr_accessor :cats, :cat, :dog, :dogs
  attr_reader :species, :name
  @@all = []
  
  def initialize(name)
    @species = "human"
    @name = name
    @@all << self
  end
  
  def say_species
    "I am a #{species}."
  end
  
  def self.all 
    @@all
  end
  
  def self.count 
    @@all.count
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats 
    Cat.all.select {|cat| cat.owner == self }
  end
  
  def dogs 
    Dog.all.select {|dog| dog.owner == self} 
  end
  
  def buy_cat(name) 
    new_cat = Cat.new(name, self)
    owner = self
    @@all << new_cat
    @@all 
  end
  
  def buy_dog(name) 
    new_dog = Dog.new(name, self)
    owner = self
    @@all << new_dog
    @@all 
  end

  def walk_dogs

    Dog.all.each do |dogs|
      dogs.mood = "happy"
    end
  end 
  def feed_cats

    Cat.all.each do |cats|
      cats.mood = "happy"
    end
  end 

  def sell_cats
    Cat.all.map do |cats|
      cats.mood = "nervous"
      cats.owner = nil
    end
  end

  def sell_dogs 
    Dog.all.each do |dogs|
      dogs.mood = "nervous"
      dogs.owner = nil
    end
  end

  def sell_pets 
    self.sell_dogs && self.sell_cats 
    @@all = []
  end
  def list_pets 
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end 
end 