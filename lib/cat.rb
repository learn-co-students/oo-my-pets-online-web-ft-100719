# Cat
#   Instance methods
#     initializes with a name and an Owner (FAILED - 9)
#     can change its owner (FAILED - 10)
#     can't change its name (FAILED - 11)
#     initializes with a nervous mood (FAILED - 12)
#     can change its mood (FAILED - 13)
#   Class methods
#     knows all the cats (FAILED - 14)



class Cat

  attr_accessor :owner, :mood
  attr_reader :name

  @@all=[]

  def initialize(name, owner)
    @name=name
    @owner=owner
    @mood= "nervous"
    @@all<<self
  end

  def self.all
    @@all
  end

end
