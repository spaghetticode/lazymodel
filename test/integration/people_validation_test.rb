require 'test_helper'

class PeopleValidationClass < ActiveSupport::TestCase
  test 'renders person form' do
    visit '/people/new'
    assert_match 'Validate Person', page.body
  end

  test 'successfully validates valid person' do
    visit '/people/new'
    fill_in 'Name', :with => 'john'
    fill_in 'Surname', :with => 'doe'
    click_button 'Validate'
    assert_match 'Person is valid', page.body
  end

  test 'does not validate invalid person' do
    visit '/people/new'
    fill_in 'Name', :with => 'john'
    click_button 'Validate'
    assert_match 'Person is not valid', page.body
  end
end
