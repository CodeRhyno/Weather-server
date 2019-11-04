class DeviceController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin

    def index
        @devices = Device.all
    end

    def new
        @device = Device.new
        @users = []
        User.all.each do |u|
            @users.append u.id
        end
    end

    def create
        @device = Device.new(set_params)
        
        if @device.save
            @device.set_reg_num
            @device.set_auth_token
            redirect_to dashboard_root_path
        else
            render 'new'
        end
    end

    def edit
        @device = Device.find_by(id: params[:id])
    end

    def update
    end

    def disable
        @device = Device.find_by(id: params[:id])
        @device.disable_device
    end

    def enable
        @device = Device.find_by(id: params[:id])
        @device.enable_device
    end

    def show
        @data = Datum.where(device_id: params[:id])
    end

    def destroy
    end

    private
    def set_params
        params.require(:device).permit(:user_id, :model_number, :is_alive)
    end
end
