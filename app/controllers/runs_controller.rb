class RunsController < ApplicationController
  respond_to :json

  def index
    @runs = Run.joins(:read_groups).uniq.where(read_groups: { project: params[:project_id] })

    respond_with @runs
  end

  def show
    render json: Run.find(params[:id]), include: [:read_groups]
  end

  def update
    run = Run.find(params[:id])
    status = run.update_attributes(run_params) ? 200 : :unprocessable_entity

    respond_with run, status: status
  end

  def destroy
    respond_with Run.destroy(params[:id])
  end

  private
  def run_params
    params.require(:run).permit(:name, :date, :instrument, :instrument_type)
  end
end