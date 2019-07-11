class ApplicationController < ActionController::API
    include Knock::Authenticable

    before_action :authenticate_user
    
    private
    def authenticate_v1_user
        authenticate_for V1::User
    end
end