require 'rails_helper'
include Warden::Test::Helpers
RSpec.describe "New", :type => :request do
    context "non-signed in user" do
        it 'redirects to root path' do
            get '/posts/new'
            expect(response).to redirect_to(root_path)
        end
    end

    context "signed_in user " do
        let(:user) { create(:user) }
        before(:each) { login_as user } 
        it 'redirects to new template' do
            get '/posts/new'
            expect(response).to render_template(:new)
        end
    end
end