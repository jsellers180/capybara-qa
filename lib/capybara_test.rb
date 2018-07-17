# frozen_string_literal: true

require 'capybara/minitest'
require 'capybara/minitest/spec'
require 'minitest/autorun'

Capybara.app_host = 'https://staging.openlistings.com'
Capybara.default_max_wait_time = 5
Capybara.default_driver = :selenium_chrome

class CapybaraTest < Minitest::Test
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
