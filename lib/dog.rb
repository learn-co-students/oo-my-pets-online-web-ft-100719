# Dog
#   Instance methods
#     initializes with a name and an Owner (FAILED - 15)
#     can change its owner (FAILED - 16)
#     can't change its name (FAILED - 17)
#     initializes with a nervous mood (FAILED - 18)
#     can change its mood (FAILED - 19)
#   Class methods
#     knows all the dogs (FAILED - 20)


class Dog

  attr_accessor :owner, :mood
  attr_reader :name

  @@all=[]

  def initialize(name, owner)
    @name=name
    @owner=owner
    @mood="nervous"
    @@all<<self
  end

  def self.all
    @@all
  end


end
