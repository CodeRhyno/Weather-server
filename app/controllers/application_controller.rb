class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def authenticate_admin
        if user_signed_in?
            if current_user.is_admin != true
                redirect_to root_path
            end
        end
    end

    def authenticate_device
    end

end
