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
  
  context "no_posts_partial_path" do
    it "it returns a no posts partial" do
      assign(:posts , [])
      expect(helper.no_posts_partial_path).to eq(
        'posts/branch/no_posts'
      )
    end
    it "it returns a empty  partial" do
      assign(:posts, [1])
      expect(helper.no_posts_partial_path).to eq(
        'shared/empty_partial'
      )
    end
  end
end
