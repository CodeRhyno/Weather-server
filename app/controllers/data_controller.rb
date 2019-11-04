class DataController < ApplicationController
    before_action :authenticate_device

    def create
        @data = Datum.new
        @data.device_id= @device.id
        @data.temp = params[:temp]
        @data.humidity = params[:humidity]
        @data.pressure = params[:pressure]
        @data.save
    end

    def serve
        @data = Datum.where(device_id: @device.id)
        if params[:range]
            @data = @data.where('created_at BETWEEN ? AND ?', params[:start_time], param[:end_time])
        else
            @data = @data.where(created_at: (Time.now - 24.hours)..Time.now)
        end
        render json: { data: @data }
    end
end
