require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'association' do
    it 'has many posts' do
      association = described_class.reflect_on_association(:posts).macro
      expect(association).to eq :has_many

    end
  end  
end
