class ReadGroupsController < ApplicationController
  respond_to :json

  def index
    if params[:run_id].present?
      run = Run.find(params[:run_id])
      read_groups = run.read_groups.order(:id)
    else
      read_groups = []
    end

    respond_with read_groups
  end

  def show
    respond_with ReadGroup.find(params[:id])
  end

  def update
    read_group = ReadGroup.find(params[:id])
    status = read_group.update_attributes(read_group_params) ? 200 : :unprocessable_entity

    respond_with read_group, status: status
  end

  def destroy
    respond_with ReadGroup.destroy(params[:id])
  end


  def create
    read_group = ReadGroup.new(read_group_params)

    status = read_group.save ? 200 : :unprocessable_entity

    respond_with read_group, status: status

  end


  private

  def read_group_new_update
    properties_keys = params['read_group']['properties']&.keys ||[]
    params.permit( properties: properties_keys)
  end



  def read_group_params

    properties_keys = params['read_group']['properties']&.keys || []


    params.require(:read_group).permit(:run_id, :genome_id, :project,
      :library, :barcode, :sample, :email, :library_prep_method, :input_ng,
      :shearing_method, :avg_insert_size,
      :max_insert_size, :min_insert_size,
      :notes, :pcr_cycles, :pcr_annealing_sec,
      :pcr_annealing_deg, :pcr_extension_sec,
      :pcr_extension_deg, :start_library_nm,
      :final_library_pm, :naoh_stock_date,
      :pcr_yield_ng, :pcr_conc_nm, :pcr_volume_ul,
      :notebook_location, :pre_denaturation_buffer, properties: properties_keys)
  end


end