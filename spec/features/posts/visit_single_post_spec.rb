require "rails_helper"

RSpec.feature "Visit single post", :type => :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  scenario "User goes to a single post from the home page", js: true do
    post
    visit root_path
    page.find(".single-post-card", visible: false).click
    expect(page).to have_selector('body .modal', visible: false)
    page.find('.interested a', visible: false).click
    expect(page).to have_selector('#single-post-content p', text: post.content, visible: false)
  end
end  


