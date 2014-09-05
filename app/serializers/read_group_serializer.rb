class ReadGroupSerializer < ActiveModel::Serializer
  attributes :id, :library, :barcode, :sample,
             :library_date, :library_prep_method, :input_ng,
             :shearing_method, :avg_insert_size, :max_insert_size,
             :min_insert_size, :notes, :pcr_cycles, :pcr_annealing_sec, :pcr_annealing_deg,
             :pcr_extension_sec, :pcr_extension_deg, :start_library_nm,
             :final_library_pm, :naoh_stock_date,
             :pcr_yield_ng, :pcr_conc_nm, :pcr_volume_ul, :notebook_location,
             :pre_denaturation_buffer,

             :association_meta_data

  has_one :run
end
