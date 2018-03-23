require 'rails_helper'

RSpec.feature "login", :type => :feature do
    let(:user) { create(:user) }
    scenario 'user navigates to the login page and successfully logs in',js: true do
    end
end