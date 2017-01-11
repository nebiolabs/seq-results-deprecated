class LibrariesController < ApplicationController
  respond_to :json

  def index
    if params[:run_id].present?
      run = Run.find(params[:run_id])
      library = run.libraries.order(:id)
    else
      libraries = []
    end

    respond_with libraries
  end

  def show
    respond_with Library.find(params[:id])
  end

  def update
    library = Library.find(params[:id])
    status = library.update_attributes(library_params) ? 200 : :unprocessable_entity

    respond_with library, status: status
  end

  def destroy
    respond_with Library.destroy(params[:id])
  end


  def create
    library = Library.new(library_params)

    status = library.save ? 200 : :unprocessable_entity

    respond_with library, status: status

  end


  private

  def library_new_update
    properties_keys = params['library']['properties'].keys
    params.permit( properties: properties_keys)
  end



  def library_params
    properties_keys = params['library']['properties'].keys


    params.require(:library).permit(:run_id, :genome_id, :project,
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