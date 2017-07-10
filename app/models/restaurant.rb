class Restaurant
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|restaurant| restaurant.name == name}
  end

  def reviews
    Review.all.select {|review| review.restaurant.name == self.name}.map {|e| e.content}
  end

  def customers
    Review.all.select {|review| review.restaurant.name == self.name}.map {|e| e.customer.full_name}.uniq
  end


end
