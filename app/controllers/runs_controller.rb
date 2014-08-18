class RunsController < ApplicationController
  def index
    render json: Run.all.order(:id)
  end

  def show
    render json: Run.find(params[:id])
  end

  def update
    run = Run.find(params[:id])
    if run.update_attributes!(run_params)
      response = 200
    else
      response = 500
    end
    head response, :content_type => 'text/html'
  end

  private
  def run_params
    params.permit(:name, :date, :instrument, :instrument_type)
  end
end