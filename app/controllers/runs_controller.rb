class RunsController < ApplicationController
  respond_to :json

  def index
    respond_with Run.all
  end

  def show
    respond_with Run.find(params[:id])
  end

  def create
    respond_with Run.create(run_params)
  end

  def update
    Run.update(params[:id], run_params)
  end

  def destroy
    respond_with Run.destroy(params[:id])
  end

  private
  def run_params
    params.require(:run).permit(:name, :date, :instrument, :instrument_type)
  end
end