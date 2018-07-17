require_relative '../lib/capybara_test'

class LoginTest < CapybaraTest
  def test_can_login
    visit '/'
    assert_title 'Open Listings'
  end
end
