require 'pry'

class Owner
  # code goes here
  # has_many :cats, :dogs

  attr_accessor :cats, :dogs
  attr_reader :name, :species
  @@all=[]
  @@count=0
    def initialize(name, species="human")
      @name=name
      @species=species
      @@all<< self
      @@count+=1
      # @cats=[]
      # @dogs=[]

    end

    def say_species
      "I am a #{species}."
    end

    def self.all
      @@all
    end

    def self.count
      @@count
    end

    def self.reset_all
      @@all=[]
      @@count=0
    end

    def cats
      Cat.all.select{|cat| cat.owner==self}
    end

    def dogs
      Dog.all.select{|dog| dog.owner==self}
    end

    def buy_cat(cat)
      Cat.new(cat,self)
    end

    def buy_dog(dog)
      Dog.new(dog,self)
    end

    def walk_dogs
      self.dogs.each{|dog| dog.mood="happy"}
    end

    def feed_cats
      self.cats.each{|cat| cat.mood="happy"}
    end

    def sell_pets
      # binding.pry
      self.dogs.each do |dog| 
        dog.mood="nervous"
        dog.owner= nil
      end
      self.cats.each do |cat| 
        cat.mood="nervous"
        cat.owner= nil
      end
    end

    def list_pets
      "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
    end

end