class Dog
  attr_accessor :mood
  attr_reader :name, :owner
  @@all = []

  def owner=(owner)
    @owner = owner
    owner.buy_dog(self) unless !owner || owner.dogs.include?(self)
  end

  def initialize(name, owner)
    @name = name
    self.owner = owner
    self.mood = "nervous"
    self.save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
end
