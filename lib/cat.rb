require 'pry'

class Cat
  # code goes here
  # belongs_to :owner

  attr_accessor :mood, :owner
  attr_reader  :name
  @@all=[]

    def initialize(name,owner,mood="nervous")
      @name=name
      @owner=owner
      @mood=mood
      @@all<< self
    end

    def self.all
      @@all
    end

    # def owner=(owner)
    #   # binding.pry
    #   @owner=owner
    #   owner.cats << self unless owner.cats.include?(self)
    # end

end