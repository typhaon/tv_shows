require 'rails_helper'

feature 'user deletes a character', %Q{
  As a site visitor
  I want to delete a character I don't like
  So no one else will want to watch that character
} do

# Acceptance Criteria
# * I can delete a character from the database
# * If the record is successfully deleted, I receive a notice that it was deleted

  scenario 'user deletes a character' do


    show = TelevisionShow.create(title: 'Hello Ladies', network: 'HBO' )
    character = Character.new(role: 'Stuart Pritchard', actor: 'Stephen Merchant')

    visit "/television_shows/#{show.id}"

    fill_in 'Role', with: character.role
    fill_in 'Actor', with: character.actor
    fill_in 'Description', with: character.description

    click_on 'Submit'

    expect(page).to have_content 'Success'
    expect(page).to have_content character.role

    expect(page).to have_content 'Delete'
    click_on 'Delete'

    expect(page).to have_content 'The character has been successfully deleted'

  end

end
