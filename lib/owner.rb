class Owner
  attr_accessor :pets, :cat, :dog
  attr_reader :name, :species

 @@all = []
 # @@pets = { :dogs => [], :cats => [] }
  def initialize(name, species= "human")
    @name = name
    @species = species
    @@all << self
    @@pets = { :dogs => [], :cats => [] }
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

  def pets
    @@pets[:cats] << cats
    @@pets[:dogs] << dogs
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
    @@pets[:cats] << Cat.new(name, owner = self)
  end

  def buy_dog(name)
    @@pets[:dogs] << Dog.new(name, owner = self)
  end

  def walk_dogs
      Dog.all.select do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.select do |cat|
    cat.mood = "happy"
    end
  end

  def sell_pets
    Dog.all.select do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    Cat.all.select do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
 end

 def list_pets
   "I have #{@@pets[:dogs].count} dog(s), and #{@@pets[:cats].count} cat(s)."
    end

end
