class ReadGroupSerializer < ActiveModel::Serializer
  attributes :id, :library, :barcode, :sample, :project,
             :library_date, :library_prep_method, :input_ng,
             :shearing_method, :avg_insert_size, :max_insert_size,
             :min_insert_size, :genome, :genome_size, :num_reads,
             :notes, :pcr_cycles, :pcr_annealing_sec, :pcr_annealing_deg,
             :pcr_extension_sec, :pcr_extension_deg, :start_library_nm,
             :final_library_pm, :naoh_stock_date, :contact_email,
             :pcr_yield_ng, :pcr_conc_nm, :pcr_volume_ul, :notebook_location,
             :pre_denaturation_buffer,

             :gc_biases_count,
             :insert_sizes_count,
             :base_biases_count,
             :coverage_depths_count,
             :bed_coverages_count,
             :duplicate_reads_count,
             :alignment_metrics_count,
             :library_complexities_count,
             :duplicate_groups_count

  has_one :run
end
