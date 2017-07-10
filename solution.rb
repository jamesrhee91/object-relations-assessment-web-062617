# Please copy/paste all three classes into this file to submit your solution!
class Customer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name  = last_name.capitalize
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find do |customer|
      customer.full_name == name.capitalize
    end
  end

  def self.find_all_by_first_name(name)
    self.all.select do |customer|
      customer.first_name == name.capitalize
    end
  end

  def self.all_names
    self.all.map {|customer| customer.full_name}
  end

  def add_review(restaurant, content)
    review = Review.new(restaurant, content)
    review.customer = self
  end


end


class Review
  attr_accessor :restaurant, :customer, :content

  @@all = []

  def initialize(restaurant, content)
    @restaurant = restaurant
    @content = content
    @@all << self
  end

  def self.all
    @@all
  end


end


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
