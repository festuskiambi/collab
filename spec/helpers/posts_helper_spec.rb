require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, type: :helper do
  context "# create_new_post_partial_path" do
    it "returns signed in  partial links" do
      helper.stub(:user_signed_in?).and_return(true)
      expect(helper.create_new_post_partial_path).to eq(
        'posts/branch/create_new_post/signed_in'
      )
    end
    it "returns not signed in partial links" do
      helper.stub(:user_signed_in?).and_return(false)
      expect(helper.create_new_post_partial_path).to eq(
        'posts/branch/create_new_post/not_signed_in'
      )
    end
  end 
  
  context"#all_categories_button_partial_path" do
    it "returns all selected partial links" do
      controller.params[:category] = ''
      expect(helper.all_categories_button_partial_path).to eq(
        'posts/branch/categories/all_selected'
      )
    end
    it "returns all not selected partial links" do
      controller.params[:category] = 'category'
      expect(helper.all_categories_button_partial_path).to eq(
        'posts/branch/categories/all_not_selected'
      )
    end
  end
  
  context "#no_posts_partial_path" do
    it "it returns a no posts partial path" do
     
      expect(helper.no_posts_partial_path([])).to eq(
        'posts/shared/no_posts'
      )
    end
    it "it returns a empty  partial path" do
      expect(helper.no_posts_partial_path([1])).to eq(
        'shared/empty_partial'
      )
    end
  end

  context "#post_format_partial_path" do
    it "returns the homepage partial path" do
      helper.stub(:current_page?).and_return(true)
      expect(helper.post_format_partial_path).to eq(
        'posts/post/home_page'
      )
    end
    it "returns the branch_page partial path" do
      helper.stub(:current_page?).and_return(false)
      expect(helper.post_format_partial_path).to eq(
        'posts/post/branch_page'
      )
    end
  end

  context "contact_user_partial_path" do
    before(:each) do
      @current_user = create(:user,id: 1)
      helper.stub(:current_user).and_return(@current_user)
    end

    it "returns a currrent_user partial path" do
      helper.stub(:user_signed_in?).and_return(true)
      assign(:post,create(:post,user_id:create(:user,id: 2).id))
      expect(helper.contact_user_partial_path).to eq(
        'posts/show/contact_user'
      )
    end
    it 'returns an empty partial path' do
      helper.stub(:user_signed_in?).and_return(true)
      assign(:post, create(:post, user_id: @current_user.id))
      expect(helper.contact_user_partial_path).to eq (
        'shared/empty_partial'
      )
    end
  end

  context "leave_message_partial_path" do
    it 'returns already in touch partial path' do
      assign('message_has_been_sent',true)
      expect(helper.leave_message_partial_path).to eq(
        'posts/show/contact_user/already_in_touch'

      )
    end
    it 'returns the message partial path' do
      assign('message_has_been_sent', false)
      expect(helper.leave_message_partial_path).to eq(
        'posts/show/contact_user/message_form'

      )
    end
  end


end
