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
      task = TaskManager.find(1)

      assert_equal "learn sinatra", task.title
      assert_equal "seriously.", task.description
      assert_equal 1, task.id
    end

    def test_it_return_all
      create_tasks

      assert_equal 1, TaskManager.all.first.id
      assert_equal 3, TaskManager.all.length
    end

    def test_it_can_update_a_task
      create_tasks
      data2 = { :title        => "new title",
                :description  => "new description"}

      task = TaskManager.find(1)

      assert_equal "learn sinatra", task.title
      assert_equal "seriously.", task.description
      assert_equal 1, task.id

      TaskManager.update(1, data2)
      task = TaskManager.find(1)

      assert_equal "new title", task.title
      assert_equal "new description", task.description
      assert_equal 1, task.id
    end

    def test_it_can_destroy_task
      create_tasks

      assert_equal 3, TaskManager.all.length
      assert_equal 1, TaskManager.all.first.id

      TaskManager.delete(1)

      assert_equal 2, TaskManager.all.length
      assert_equal 2, TaskManager.all.first.id
    end

    def test_it_can_find_by_id
      create_tasks

      assert_equal 2, TaskManager.find(2).id
    end
  end

#destroy, find
