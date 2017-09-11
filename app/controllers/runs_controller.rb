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

  def create
    if run_params[:flow_cell]
      run = Run.find_by(:flow_cell => run_params[:flow_cell])
    end

    run ||=  Run.new(run_params)

    status = run.save ? 200 : :unprocessable_entity

    respond_with run, status: status
  end

  private
  def run_params
    params.require(:run).permit(:name, :flow_cell, :date, :instrument, :instrument_type, :read_1_size, :index_read_2_size,
                                :read_3_size, :index_read_4_size,:run_parameters_version, :flowcell_serial_number,
                                :flowcell_part_number,:flowcell_expiration_date,:pr2bottle_serial_number,
                                :pr2bottle_part_number,:pr2bottle_expiration_date, :reagent_kit_serial_number,
                                :reagent_kit_part_number, :reagent_kit_expiration_date,:reagent_kit_version, :run_id,
                                :scanner_id, :run_number, :fpga_version, :mcs_version, :rta_version, :experiment_name,
                                :chemistry,:username,:workflow_analysis,:enable_analysis, :samplesheet_raw)
  end

end