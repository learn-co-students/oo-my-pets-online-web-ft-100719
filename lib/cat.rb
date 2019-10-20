class Cat
  attr_accessor :owner, :mood
  attr_reader :name
  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end

  def owner_name=(name)
   owner = Owner.find_or_create_by_name(name)
   self.owner = owner
   owner.buy_cat(self)
  end
end
