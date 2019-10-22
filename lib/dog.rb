class Dog
  # code goes here
  attr_accessor  :mood, :owner
  attr_reader :name
  @@all=[]

    def initialize(name, owner, mood="nervous")
      @name=name
      @owner=owner
      @mood=mood
      @@all<< self
    end

    def self.all
      @@all
    end

    # def owner=(owner)
    #   @owner=owner
    #   owner.dogs << self unless owner.dogs.include?(self)
    # end


end