require 'rails_helper'

RSpec.feature 'logout', :type => :feature do
    let(:user) { create(:user) }
    it 'logs out a signed in user',js: true do
        sign_in user
        visit root_path
        find('nav #user-settings').click
        find('nav a', text: 'Log out').click
        expect(page).to have_content('Login')
    end
end