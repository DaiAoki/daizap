class Api::V1::RecordsController < ApplicationController

  def index
    records = Record.all
    render json: records
  end

  def create
    record = Record.new(record_params)
    if record.save
      render json: record, status: :created
    else
      render json: record, status: :unprocessable_entity
    end
  end



  private

    def record_params
      params.permit(:weight, :image)
    end
end
