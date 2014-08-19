class RunsController < ApplicationController
  respond_to :json

  def index
    respond_with Run.all
  end

  def show
    respond_with Run.find(params[:id])
  end

  def create
    @run = Run.create(run_params)
    status = @run.errors.present? ? :unprocessable_entity : 200

    respond_with @run, status: status
  end

  def update
    @run = Run.find(params[:id])
    status = @run.update_attributes(run_params) ? 200 : :unprocessable_entity

    respond_with @run, status: status
  end

  def destroy
    respond_with Run.destroy(params[:id])
  end

  private
  def run_params
    params.require(:run).permit(:name, :date, :instrument, :instrument_type)
  end
end