class Owner
  attr_reader :name, :species, :pets
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @pets = {}
    self.save
  end

  def save
    @@all << self
  end

  def say_species
    "I am a #{@species}."
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

  def buy_pet(pet, pet_category)
    if self.pets.has_key?(pet_category) #if this category of pet already exists for the owner
      pets[pet_category] << pet unless pets[pet_category].include?(pet) #put the pet into the category, unless the owner already owns the pet
    else #if they didn't have any of this kind of pet before
      pets[pet_category] = [pet] #create a new pet category and add the pet to it
    end
    pet.owner = self #make sure the pet knows who owns it
  end

  def buy_helper(pet_input, pet_category, pet_category_class)
    if pet_input.is_a?(pet_category_class)#if the pet given is a pet object of the class provided
      buy_pet(pet_input, pet_category) #just use the buy_pet method
    elsif pet_input.is_a?(String) #if the pet given is a string of a pet name
      pet_proper = pet_category_class.all.find{|pet_object| pet_object.name == pet_input} #try and see if that pet already exists
      if pet_proper #if the pet already exists
        buy_pet(pet_proper, pet_category) #buy that pet
      else
        buy_pet(pet_category_class.new(pet_input, self), pet_category) #if it doesn't exist, make a new pet and buy that
      end
    else
      puts "Not a #{pet_category.to_s.chop}." #otherwise, let them know what they provided was bad input
    end
  end

  def buy_cat(cat)
    buy_helper(cat, :cats, Cat)
  end

  def buy_dog(dog)
    buy_helper(dog, :dogs, Dog)
  end

  def cats
    if pets[:cats]
      pets[:cats]
    else
      []
    end
  end

  def dogs
    if pets[:dogs]
      pets[:dogs]
    else
      []
    end
  end

  def walk_dogs
    self.dogs.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.pets.each do |category, array|
      array.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
    end
    self.pets.clear
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
