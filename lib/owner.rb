class Owner
  attr_reader :name, :species
  #attr_accessor :all_cats, :all_dogs # code goes here
  
  @@all = []
  
  
  def initialize(name)
    @name = name
    @species = "human"
    @all_cats = []
    @all_dogs = []
    @@all << self
  end
  
  def say_species
    "I am a human."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.size
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    Cat.new(name, self)
    
  
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs
    Dog.all.map { |this_dog| this_dog.mood = "happy"}
  end
  
  def feed_cats
    Cat.all.map { |this_cat| this_cat.mood = "happy"}
  end
  
  def sell_pets
    Dog.all.map  do |this_dog| 
      this_dog.mood = "nervous"
      this_dog.owner = NIL
    end
    
    Cat.all.map  do |this_cat| 
      this_cat.mood = "nervous"
      this_cat.owner = NIL
    end
   
  end #sell_pets
  
  def list_pets
    num_cats = cats.count
    num_dogs = dogs.count
    "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end
end