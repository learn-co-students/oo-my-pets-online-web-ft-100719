class Owner
  
    @@all = []
  
  attr_reader :name, :species

  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self
  end
  
  def say_species 
    return "I am a human."
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
    my_cats = []
    Cat.all.each do |cat|
    my_cats << cat if cat.owner == self 
  end 
    my_cats 
  end 
  
  def dogs 
    my_dogs = []
    Dog.all.each do |dog|
      my_dogs << dog if dog.owner == self
    end 
    my_dogs
   end 
  
  def buy_cat(name)
    Cat.new(name, self)
  end 
  
  def buy_dog(name)
    Dog.new(name, self)
  end 
    
    def walk_dogs
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
    cats.each do |cat|
      cat.owner = nil 
      cat.mood = "nervous"
    end
    dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end 
  end 
  
  def list_pets 
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 
  
end
