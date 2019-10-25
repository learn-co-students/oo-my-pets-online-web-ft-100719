require "pry"
class Owner
  attr_reader :name, :species
  attr_accessor :cats, :dogs
  
  @@all = []
  
  
  def initialize(name) 
      @name = name
      @species = "human"
      @cats = []
      @dogs = []  
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
  
  def say_species 
     "I am a human."
  end 
  
  def buy_cat(cat_name)
      new_cat = Cat.new(cat_name,self)
      # cat = Cat.all.find { |c| c.name == cat_name }
      # @cats << new_cat
  end 
  
  def buy_dog(dog_name)
      new_dog = Dog.new(dog_name,self) 
      # @dogs << new_dog
  end 
  
  def walk_dogs 
      # binding.pry
      @dogs.each { |dog| dog.mood = "happy"}
  end 
  
  def feed_cats 
     @cats.each { |cat| cat.mood = "happy"}
  end 
  
  def sell_pets 
      @dogs.each do |dog| 
        dog.mood = "nervous" 
        dog.owner = nil
      end
    
      @dogs.clear
    
      @cats.each do |cat| 
        cat.mood = "nervous"
        cat.owner = nil
      end
      
      @cats.clear
      
      # @dogs.each { |dog| dog.owner = nil}
      # @cats.each { |cat| cat.owner = nil}
  end 
  
  def list_pets 
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
 
end