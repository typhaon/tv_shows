require 'rails_helper'
require 'pry'

feature 'user views a list of all characters', %Q{
  As a site visitor
  I want to view a list of people's favorite TV characters
  So I can find wonky characters to watch} do

  # Acceptance Criteria
  # * I can view a list of all characters
  # * The character's name and the TV show it is associated
  #   with are listed.


  scenario 'user views characters' do

    show_attrs = { title: 'Hello Ladies', network: 'HBO' }


    show = TelevisionShow.create(show_attrs)

    characters = []
    character_attrs = [
      { role: 'Jessica', actor: 'Christine Woods', television_show_id: show.id },
      { role: 'Wade', actor: 'Nate Torrence', television_show_id: show.id }
    ]

    character_attrs.each do |attrs|
      characters << Character.create(attrs)
    end

    visit '/characters'
        characters.each do |character|
      expect(page).to have_content character.role
      expect(page).to have_content character.television_show.title
    end




  end
end

