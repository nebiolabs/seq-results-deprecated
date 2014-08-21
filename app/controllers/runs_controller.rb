class RunsController < ApplicationController
  respond_to :json

  def index
    respond_with Run.all.order(:id)
  end

  def show
    render json: Run.find(params[:id]), include: [:read_groups]
  end

  def create
    run = Run.create(run_params)
    status = run.errors.present? ? :unprocessable_entity : 200

    respond_with run, status: status
  end

  def update
    run = Run.find(params[:id])
    status = @run.update_attributes(run_params) ? 200 : :unprocessable_entity

    respond_with run, status: status
  end

  def destroy
    respond_with Run.destroy(params[:id])
  end

  private
  def run_params
    params.require(:run).permit(:library, :barcode, :sample)
  end
end