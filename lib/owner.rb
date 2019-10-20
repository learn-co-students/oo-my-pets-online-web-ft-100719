class Owner
  attr_accessor :pets, :cat
  attr_reader :name, :species
 @@all = []

  def initialize(name, species= "human")
    @name = name
    @species = species
    @@all << self
    @pets = {:cats => [], :dogs => []}
  end

  def species
    @species
  end

  # def pets
  #   @@pets
  # end

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
  @pets[:cats] << Cat.new(name, owner = self)
end

def buy_dog(name)
  @pets[:dogs] << Dog.new(name, owner = self)
end

def walk_dogs
  @pets[:dogs].each do |dog|
     dog.mood = "happy"
  end
end

end
