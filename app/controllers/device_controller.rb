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
        @data = Datum.where(device_id: @device)
        @users = []
        User.all.each do |u|
            @users.append u.id
        end
    end

    def update
        @device = Device.new
        if @device.update(set_update_params)
            redirect_to edit_device_path(@device)
        else
            render 'edit'
        end
    end

    def disable
        @device = Device.find_by(id: params[:id])
        @device.disable_device
        redirect_to edit_device_path(@device)
    end

    def enable
        @device = Device.find_by(id: params[:id])
        @device.enable_device
        redirect_to edit_device_path(@device)
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

    def set_update_params
        params.require(:device).permit(:user_id, :model_number, :is_alive, :token_is_valid)
    end
end
