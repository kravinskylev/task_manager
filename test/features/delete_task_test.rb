require_relative '../test_helper'

class CreateNewTaskTest < FeatureTest
  def create_task
    visit '/tasks/new'
    fill_in 'task[title]', :with => 'title'
    fill_in 'task[description]', :with => 'description'
    click_button 'Submit'
  end

  def test_user_can_delete_task
    create_task

    visit '/tasks/1'
    click_link_or_button 'delete'
    visit '/tasks'

    refute page.has_content? 'title'
  end
end
