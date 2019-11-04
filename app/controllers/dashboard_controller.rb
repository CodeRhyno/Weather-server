class DashboardController < ApplicationController
    before_action :authenticate_user!

    def index
        if current_user.is_admin
            redirect_to device_index_path
        end
        @device = Device.where(user_id: current_user.id)
    end
end
