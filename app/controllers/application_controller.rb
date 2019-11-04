class ApplicationController < ActionController::Base

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
