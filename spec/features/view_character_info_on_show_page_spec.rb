require 'rails_helper'

feature "user views character information on a show page", %Q{
  As a site visitor
  I want to view the details for a TV show
  So that I can learn more about it
} do
  # Acceptance Criteria
  # * I can see a show's title, network, the years it
  # ran, and a synopsis.
  # * For each character, I can see the character's name,
  # actor's name, and the character's description.

  scenario "user views a TV show's details" do

    show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO', years: '2011 - 2014', synopsis: 'Seven noble families fight
       for control of the mythical land of Westeros.')

    character = Character.create(role: 'Cersei Lannister', actor: 'Lena Headey',
      description: 'The eldest child of Tywin and Joanna Lannister by mere
       moments, and the twin sister of Jaime Lannister.', television_show_id: show.id)

    visit "/television_shows/#{show.id}"

    expect(page).to have_content show.title
    expect(page).to have_content show.network
    expect(page).to have_content show.years
    expect(page).to have_content show.synopsis
    expect(page).to have_content character.role
    expect(page).to have_content character.description
    expect(page).to have_content character.actor
    end

end
