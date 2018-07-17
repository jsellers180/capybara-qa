# frozen_string_literal: true

require_relative '../lib/capybara_test'
require_relative '../support/pageObjects/offers_page'
require 'faker'


include Capybara::DSL

# This test will perform an XSS attack. This is a major security hole.
class XSSInputTest < CapybaraTest

  def test_create_account_with_password
    offers_page = OffersPage.new

    # Visits the offers page to access the search field
    visit '/offers/new'
    # Performs a XSS attack that will open an alert
    accept_alert do
      fill_in(offers_page.search_field, with: "<SCRIPT>alert('XSS')</SCRIPT>")
      @alert = page.driver.browser.switch_to.alert.text
    end
    # Asserts that the alert appeared and contained the correct text
    assert_includes @alert, 'XSS'
  end
end