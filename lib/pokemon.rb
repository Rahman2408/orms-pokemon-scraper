class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name 
        @type = type
        @db = db
    end 

    def self.save(name, type, db)
    
                
            sql = <<-SQL 
                    INSERT INTO pokemon (name, type)
                    VALUES (?,?)
                    SQL
        db.execute(sql, name, type)        
    end

    def self.find(id, db)
        sql = <<-SQL
                SELECT * FROM pokemon 
                WHERE id = ?
                SQL
        new_poke_obj = db.execute(sql, id)[0]
    self.new(id: new_poke_obj[0], name: new_poke_obj[1], type: new_poke_obj[2], db: db)
    end
end
