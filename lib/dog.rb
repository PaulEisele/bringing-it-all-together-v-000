class Dog

  attr_accessor :name, :breed
  attr_reader :id

  def initialize(name:, breed:, id: nil)
    @name = name
    @breed = breed
    @id = id
  end

  def self.create_table
    sql =<<-SQL
    CREATE TABLE IF NOT EXISTS dogs(
      id INTEGER PRIMARY KEY,
      name TEXT,
      breed TEXT
    );
    SQL
    DB[:conn].excute(sql)
  end

  def self.drop_table
    sql =<<-SQL
    DROP TABLE dogs
    SQL
    DB[:conn].execute(sql)
  end

  def self.new_from_db(row)
    id = row[0]
    name = row[1]
    breed = row[2]
    self.new(id: id, name: name, breed: breed)
  end


  def self.find_by_name

  end

  def save

  end

  def update
    sql =<<-SQL
    UPDATE dogs
    SET name = ?, breed = ?
    WHERE

  end
end
