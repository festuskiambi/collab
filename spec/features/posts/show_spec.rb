require 'rails_helper'
include Warden::Test::Helpers
RSpec.describe "branches", type: :request do
    shared_examples 'render_show_template' do
        let(:post) { create(:post) }
        it 'renders the show template' do
            get post_path(post)
            expect(response).to render_template(:show)
        end
    end
    context "non sighned in user" do
        it_behaves_like 'render_show_template'
    end

    context 'sighned in user' do
        let(:user) {create(:user) }
        before(:each) {login_as  user}

        it_behaves_like 'render_show_template'
    end
end
