# frozen_string_literal: true

require_relative '../lib/capybara_test'
require_relative '../support/pageObjects/offers_page'
require 'faker'


include Capybara::DSL

# This test will verify that the user can enter garbage text into a date field and no validation occurs.
class Test < CapybaraTest

  def test_create_account_with_password
    offers_page = OffersPage.new

    # Visits the signup path
    visit '/offers/new'
    fill_in(offers_page.search_field, with: '4513 gilpin frazier park')
    find('.property-form-group', match: :first).click
    # Fills in the user details with randomly generated info for re-usability
    fill_in(offers_page.name_field, with: 'josh sellers')
    fill_in(offers_page.email_field, with: [Faker::Internet.slug,
                                             Time.now.to_i,
                                            '@openlistings.com'].join)
    fill_in(offers_page.phone_number_field, with: '8888888888')
    fill_in(offers_page.password_field, with: 'firerootlife')
    click_button('Yes')
    fill_in(offers_page.visit_dates, with: 'asdawdawdw')
    click_button(offers_page.submit_button)
    assert_text('Create Your Offer')
  end
end