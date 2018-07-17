# frozen_string_literal: true

require_relative '../lib/capybara_test'
require_relative '../support/pageObjects/signup_page'
require 'faker'


include Capybara::DSL

# This test will signup with a new account that uses 'password' as it's password. This is a major security hole.
class SignupTest < CapybaraTest

  def test_create_account_with_password
    signup_page = SignupPage.new

    # Visits the signup path
    visit '/signup'
    # Fills in the email field with a randomly generated email for re-usability
    fill_in(signup_page.email_field, with: [Faker::Internet.slug,
                                             Time.now.to_i,
                                             '@openlistings.com'].join)
    # Fills in the password field with password. This is a major security flaw and should be on a banned list.
    fill_in(signup_page.password_field, with: 'password')
    # Clicks the signup button
    click_button(signup_page.signup_button)
    #Asserts that the signup was successful with password
    assert_title('Setup')
  end
end
