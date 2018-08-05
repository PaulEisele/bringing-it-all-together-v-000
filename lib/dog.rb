class Dog

  attr_accessor :name, :breed
  attr_reader :id

  def initialize(name:, breed:, id: nil)
    @name = name
    @breed = breed
    @id = id
  end

  def self.create_table

  end

  def self.drop_table

  end

  def self.new_from_db

  end


  def self.find_by_name

  end

  def save

  end

  def update

  end 

  
