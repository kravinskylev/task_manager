require_relative '../test_helper'

class HomePageTest < FeatureTest
  def test_user_sees_index_and_new_links
    visit '/'
      within('#welcome-header') do
        assert page.has_content?("Task Manager")
      end
  end

  def test_user_can_click_new_task
    visit '/'
    click_link('New Task')
    assert_equal current_path, '/tasks/new'
  end
end
