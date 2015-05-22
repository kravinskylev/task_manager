class TaskManager
  def self.database
    if ENV["TASK_MANAGER_ENV"] == "test"
      @database ||= Sequel.sqlite('db/task_manager_test.sqlite3')
    else
      @database ||= Sequel.sqlite('db/task_manager_dev.sqlite3')
    end
  end

  def self.create(task)
    database.from(:tasks).insert( :title       => task[:title],
                                  :description => task[:description])
  end

  def self.all
    database.from(:tasks).map {|task| Task.new(task)}
    # raw_tasks.map { |data| Task.new(data) }
  end

  def self.find(id)
    task = database.from(:tasks).where(:id => id)
    Task.new(task.to_a.first)
  end

  def self.update(id, data)
    database.from(:tasks).where(:id => id).update(data)
  end

  def self.delete(id)
    database.from(:tasks).where(:id => id).delete
  end

  def self.delete_all
    database.from(:tasks).delete
    # database.transaction do
    #   database["tasks"] = []
    #   database["total"] = 0
    # end
  end
end
