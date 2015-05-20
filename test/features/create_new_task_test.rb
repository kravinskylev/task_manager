require_relative '../test_helper'

class CreateNewTaskTest < FeatureTest
  def test_user_can_create_new_task
    visit '/tasks/new'
    fill_in 'task[title]', :with => 'new title'
    fill_in 'task[description]', :with => 'new description'
    click_button('Submit')
    assert page.has_content?("new title")
  end
end
