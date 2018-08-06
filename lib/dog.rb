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
    DB[:conn].execute(sql)
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
    sql =<<-SQL
    SELECT *
    FROM dogs
    WHERE name = ?
    LIMIT 1;
    SQL
    row = DB[:conn].execute(sql, name)[0]
    self.new_from_db(row)
  end

  def save
    if self.id
      update
    else
      sql =<<-SQL
      INSERT INTO dogs(self.name, self.breed)
      VALUES (?, ?)
      SQL
      self.id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
  end
end

  def update
    sql =<<-SQL
    UPDATE dogs
    SET name = ?, breed = ?
    WHERE id = ?;
    SQL
    DB[:conn].execute(sql, self.name, self.breed, self.id)
  end

  def self.create
    dog = self.new(name: name, breed: breed)
    dog.save
    dog
  end
end
