# frozen_string_literal: true

# login page object definition
class LoginPage

  def email_field
    'your_email'
  end

  def password_field
    'create_a_password'
  end

  def search_field
    '#content > div > div.app-view.push-footer > div:nth-child(1) > header > div.logged-out-header > div.logged-out-header__section.logged-out-header__section--left > div.search-bar-container'
  end

  def search_field_focus
    '.user-input.focus'
  end

  def submit_button
    'Submit'
  end

end