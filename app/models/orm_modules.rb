module ClassMethodsORM
  def self.find(id)
    records = DB.execute("SELECT * FROM #{table} WHERE id = #{id}")
    record = records[0]

    Task.new(fields)
  end
end

module InstanceMethodsORM
  def self.update(attributes)
  end
end