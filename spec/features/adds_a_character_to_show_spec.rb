require 'rails_helper'

feature 'user adds a new character', %Q{
  As a site visitor
  I want to add my favorite TV show characters
  So that other people can enjoy their crazy antics
} do

  # Acceptance Criteria:
  # * I can access a form to add a character to a TV show's page
  # * I must specify the character's name and the actor's name
  # * I can optionally provide a description
  # * If I do not provide the required information, I receive an error message
  # * If the character already exists in the database, I receive an error message

  scenario 'user adds a new character' do



    show = TelevisionShow.create(title: 'Hello Ladies', network: 'HBO' )
    character = Character.new(role: 'Stuart Pritchard', actor: 'Stephen Merchant')

    visit "/television_shows/#{show.id}"

    fill_in 'Role', with: character.role
    fill_in 'Actor', with: character.actor
    fill_in 'Description', with: character.description

    click_on 'Submit'

    expect(page).to have_content 'Success'
    expect(page).to have_content character.role

  end


  scenario 'without requirements' do

    show = TelevisionShow.create(title: 'Hello Ladies', network: 'HBO' )
    character = Character.new(role: 'Stuart Pritchard', actor: 'Stephen Merchant')

    visit "/television_shows/#{show.id}"
    click_on 'Submit'

    expect(page).to have_content "can't be blank"

  end

  scenario 'character already exists' do

    show = TelevisionShow.create(title: 'Hello Ladies', network: 'HBO' )
    character = Character.create(role: 'Stuart Pritchard', actor: 'Stephen Merchant')

    visit "/television_shows/#{show.id}"
    fill_in 'Role', with: character.role

    click_on 'Submit'

    expect(page).to_not have_content "Success"
    expect(page).to have_content "could not be saved."
  end

end

