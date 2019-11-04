class DataController < ApplicationController
    before_action :authenticate_device

    def create
        @data = Data.new(set_params)
        @data.save
    end

    private
    def set_params
        params.require(:datum).permit(:device_id, :temp, :humidity, :pressure)
    end
end
