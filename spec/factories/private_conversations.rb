FactoryBot.define do
  factory :private_conversation, class: 'Private::Conversation' do
    association :recipient, factory: :user
    association :sender, factory: :user

    factory :private_conversation_with_message do
      
    end
    
  end
end
