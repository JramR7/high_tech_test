class ApplicationController < ActionController::API
    include Knock::Authenticable
    
    # Method for checking if current_user is admin or not.
    def authorize_as_admin
        render status: :unauthorized unless !current_user.nil? && current_user.is_admin?
    end
end
