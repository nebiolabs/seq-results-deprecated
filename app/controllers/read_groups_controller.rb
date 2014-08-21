class ReadGroupsController < ApplicationController
  respond_to :json

  # def index
  #   run = Run.find(params[:run_id])
  #   respond_with run.read_groups
  # end

  def show
    respond_with ReadGroup.find(params[:id])
  end

  def create
    read_group = ReadGroup.create(run_group_params)
    status = read_group.errors.present? ? :unprocessable_entity : 200

    respond_with read_group, status: status
  end

  def update
    read_group = ReadGroup.find(params[:id])
    status = read_group.update_attributes(run_group_params) ? 200 : :unprocessable_entity

    respond_with read_group, status: status
  end

  def destroy
    respond_with ReadGroup.destroy(params[:id])
  end

  private
  def read_group_params
    params.require(:read_group).permit(:name, :date, :instrument, :instrument_type)
  end
end