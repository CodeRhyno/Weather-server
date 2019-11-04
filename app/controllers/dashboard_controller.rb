class DashboardController < ApplicationController
    before_action :authenticate_user!

    def index
        if current_user.is_admin
            redirect_to device_index_path
        end
        @device = Device.where(user_id: current_user.id)
    end

    def show
        @devices = Device.where(user_id: current_user.id)
    end

    def disable_device
        @device = Device.find(params[:id])
        @device.is_alive = false
        @device.save
        redirect_to view_devices_path
    end

    def enable_device
        @device = Device.find(params[:id])
        @device.is_alive = true
        @device.save
        redirect_to view_devices_path
    end
end
