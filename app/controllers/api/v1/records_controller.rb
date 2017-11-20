class Api::V1::RecordsController < ApplicationController
  before_action :reject_unless_record_user, only: :destroy

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

  def destroy
    if Record.find(params[:id]).destroy
      flash[:success] = 'Success!'
    else
      flash[:warning] = 'Failure!'
    end
  end



  private

    def record_params
      params.permit(:weight, :image)
    end

    def reject_unless_record_user
      return unless Record.find(params[:id]).user == current_user
    end
end
