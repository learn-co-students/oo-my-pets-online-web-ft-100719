class Dog
  attr_accessor :mood
  attr_reader :name, :owner
  @@all = []

  def initialize(name, owner)
    @name = name
    self.owner = owner
    self.mood = "nervous"
    @@all.push(self)
  end

  def owner=(owner)
    @owner = owner
    owner.buy_dog(self) unless !owner || owner.dogs.include?(self)
  end

  def self.all
    @@all
  end
end