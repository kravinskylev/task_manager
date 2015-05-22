require_relative '../test_helper'
  class TaskManagerTest < Minitest::Test
    def create_tasks
      data = { :title       => "learn sinatra",
               :description => "seriously."}

      data2 ={ :title        => "new title",
               :description  => "new description"}

      data3 ={ :title        => "new title1",
               :description  => "new description1"}
      TaskManager.create(data)
      TaskManager.create(data2)
      TaskManager.create(data3)
    end

    def test_it_can_create_a_task
      create_tasks
      task = TaskManager.find(TaskManager.all.last.id)

      assert_equal task.title, TaskManager.all.last.title
      assert_equal task.description, TaskManager.all.last.description
      assert_equal task.id, TaskManager.all.last.id
    end

    def test_it_return_all
      create_tasks
      task = TaskManager.find(TaskManager.all.first.id)
      assert_equal task.id, TaskManager.all.first.id
    end

    def test_it_can_update_a_task
      create_tasks

      task = TaskManager.find(TaskManager.all.first.id)

      assert_equal TaskManager.all.first.title, task.title
      assert_equal TaskManager.all.first.description, task.description
      assert_equal TaskManager.all.first.id, task.id

      data2 ={ :title        => "new title",
               :description  => "new description"}

      TaskManager.update(1, data2)
      task = TaskManager.find(TaskManager.all.first.id)

      assert_equal TaskManager.all.first.title, task.title
      assert_equal TaskManager.all.first.description, task.description
      assert_equal TaskManager.all.first.id, task.id
    end

    def test_it_can_destroy_task
      create_tasks

      first_id = TaskManager.all.first.id

      deleted_tasks = TaskManager.delete(TaskManager.all.first.id)

      refute_equal first_id, TaskManager.all.first.id
    end

    def test_it_can_find_by_id
      create_tasks
      task = TaskManager.find(TaskManager.all.first.id)
      assert_equal TaskManager.all.first.id, task.id
    end
  end

#destroy, find
