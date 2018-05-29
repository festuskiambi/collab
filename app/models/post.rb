class Post < ApplicationRecord
    belongs_to :user
    belongs_to :category

    default_scope -> { includes(:user).order(created_at: :desc) }

    scope :by_category, -> (branch, category_name) do 
        joins(:category).where(categories: {name: category_name, branch: branch}) 
    end
    
    scope :by_branch, -> (branch) do
        joins(:category).where(categories: {branch: branch}) 
    end

    scope :search, -> (search) do
        where("title ILIKE lower(?) OR content ILIKE lower(?)", "%#{search}%", "%#{search}%")
    end

    validates :title, presence: true, length: { minimum: 5, maximum: 255 }
    validates :content, presence: true, length: { minimum: 20, maximum: 1000 }
    validates :category_id, presence: true

    def send_sms
        username = 'sandbox' # use 'sandbox' for development in the test environment
        apiKey  = '4e604d9c6685cc768f5a809c40325b90523e31b7e3da7951f3b27e407217de98' # use your sandbox app API key for development in the test environment
        @AT=AfricasTalking::Initialize.new(username, apiKey)


                # Specify the numbers that you want to send to in a comma-separated list
        # Please ensure you include the country code (+254 for Kenya in this case, +256 for Uganda)
        to      = "+254725092149"
        # And of course we want our recipients to know what we really do
        message = "I'm a lumberjack and it's ok, I sleep all night and I work all day"
        # Create a new instance of our awesome gateway class
        # Any gateway error will be captured by our custom Exception class below,
        # so wrap the call in a try-catch block
        begin
          # Thats it, hit send and we'll take care of the rest.
          options = {
            "to"=> "+254725092149",
            "message"=>"I'm a lumberjack and it's ok, I sleep all night and I work all day"
          }
          reports = @AT.sms.sendMessage options
          
          reports.each {|x|
            # status is either "Success" or "error message"
            puts 'number=' + x.number + ';status=' + x.status + ';messageId=' + x.messageId + ';cost=' + x.cost
          }
        rescue Exception => ex
          puts 'Encountered an error: ' + ex.message
        end

    end

end
