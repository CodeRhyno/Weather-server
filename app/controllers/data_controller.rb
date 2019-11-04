class DataController < ApplicationController
    before_action :authenticate_device

    def create
        @data = Datum.new
        @data.device_id= params[:device_id]
        @data.temp = params[:temp]
        @data.humidity = params[:humidity]
        @data.pressure = params[:pressure]
        @data.save
    end
end
