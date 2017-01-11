# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170111195452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alignment_metrics", primary_key: "rg_id", force: true do |t|
    t.string  "category",                             null: false
    t.integer "num_reads",                  limit: 8
    t.integer "pf_reads",                   limit: 8
    t.float   "pct_pf_reads"
    t.integer "pf_noise_reads",             limit: 8
    t.integer "pf_reads_aligned",           limit: 8
    t.float   "pct_pf_reads_aligned"
    t.integer "pf_aligned_bases",           limit: 8
    t.integer "pf_hq_aligned_reads",        limit: 8
    t.integer "pf_hq_aligned_bases",        limit: 8
    t.integer "pf_hq_aligned_q20_bases",    limit: 8
    t.integer "pf_hq_median_mismatches",    limit: 8
    t.float   "pf_mismatch_rate"
    t.float   "pf_hq_error_rate"
    t.float   "pf_indel_rate"
    t.float   "mean_read_length"
    t.integer "reads_aligned_in_pairs",     limit: 8
    t.float   "pct_reads_aligned_in_pairs"
    t.integer "bad_cycles"
    t.float   "strand_balance"
    t.float   "pct_chimeras"
    t.float   "pct_adapter"
  end

  add_index "alignment_metrics", ["rg_id"], name: "in_alignment_metrics_rg_id", using: :btree

  create_table "base_biases", primary_key: "rg_id", force: true do |t|
    t.integer "read_position",           null: false
    t.integer "num_a",         limit: 8, null: false
    t.integer "num_c",         limit: 8, null: false
    t.integer "num_g",         limit: 8, null: false
    t.integer "num_t",         limit: 8, null: false
    t.integer "num_n",         limit: 8, null: false
    t.integer "num_x",         limit: 8, null: false
  end

  add_index "base_biases", ["rg_id"], name: "in_base_biases_rg_id", using: :btree

  create_table "bed_coverages", primary_key: "rg_id", force: true do |t|
    t.integer "bed_id", null: false
    t.integer "depth"
  end

  add_index "bed_coverages", ["bed_id"], name: "index_bed_coverages_on_bed_id", using: :btree
  add_index "bed_coverages", ["rg_id"], name: "in_bed_cov_rg_id", using: :btree

  create_table "bed_groups", force: true do |t|
    t.string   "name"
    t.string   "md5sum",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "genome_id"
  end

  add_index "bed_groups", ["genome_id"], name: "index_bed_groups_on_genome_id", using: :btree
  add_index "bed_groups", ["md5sum"], name: "index_bed_groups_on_md5sum", unique: true, using: :btree
  add_index "bed_groups", ["name"], name: "index_bed_groups_name", using: :btree

  create_table "bed_regions", force: true do |t|
    t.text    "name"
    t.string  "chr"
    t.integer "start",          limit: 8
    t.integer "end",            limit: 8
    t.integer "bed_group_id",             null: false
    t.float   "frac_gc"
    t.float   "folding_energy"
  end

  add_index "bed_regions", ["bed_group_id"], name: "index_bed_regions_bed_group_id", using: :btree
  add_index "bed_regions", ["bed_group_id"], name: "index_bed_regions_on_bed_group_id", using: :btree
  add_index "bed_regions", ["folding_energy"], name: "index_bed_regions_folding_energy", using: :btree
  add_index "bed_regions", ["frac_gc"], name: "index_bed_regions_gc", using: :btree

  create_table "bedgraph_files", force: true do |t|
    t.integer "read_group_id",              null: false
    t.integer "loaded_file_id",             null: false
    t.string  "md5sum",         limit: nil, null: false
    t.string  "path",           limit: nil
    t.binary  "contents"
  end

  add_index "bedgraph_files", ["loaded_file_id"], name: "index_bedgraph_files_on_loaded_file_id", using: :btree
  add_index "bedgraph_files", ["read_group_id"], name: "index_bedgraph_files_on_read_group_id", using: :btree

  create_table "coverage_depths", id: false, force: true do |t|
    t.integer "rg_id",                                                                        null: false
    t.integer "depth",                                                                        null: false
    t.string  "chromosome",                                                                   null: false
    t.integer "num_bases",  limit: 8
    t.float   "frac_bases"
    t.integer "id",                   default: "nextval('coverage_depths_id_seq'::regclass)", null: false
  end

  add_index "coverage_depths", ["id"], name: "coverage_depth_pk", unique: true, using: :btree
  add_index "coverage_depths", ["rg_id"], name: "in_cov_depth_rg_id", using: :btree

  create_table "duplicate_groups", id: false, force: true do |t|
    t.integer "rg_id",                       null: false
    t.integer "duplication_group",           null: false
    t.integer "num_reads",         limit: 8, null: false
  end

  create_table "duplicate_reads", primary_key: "rg_id", force: true do |t|
    t.integer "fold_reads",  null: false
    t.float   "fold_unique", null: false
  end

  create_table "exp_transcript_concentrations", force: true do |t|
    t.integer "transcript_id",           null: false
    t.integer "transcript_group_id",     null: false
    t.float   "exp_concentration_am_ul"
  end

  add_index "exp_transcript_concentrations", ["transcript_group_id"], name: "index_exp_transcript_concentrations_on_transcript_group_id", using: :btree
  add_index "exp_transcript_concentrations", ["transcript_id"], name: "index_exp_transcript_concentrations_on_transcript_id", using: :btree

  create_table "features", force: true do |t|
    t.string  "seqid",          limit: nil, null: false
    t.string  "source",         limit: nil, null: false
    t.string  "feature_type",   limit: nil, null: false
    t.integer "start",                      null: false
    t.integer "end",                        null: false
    t.string  "strand",         limit: nil, null: false
    t.string  "attr_id",        limit: nil, null: false
    t.integer "length"
    t.integer "exon_number"
    t.integer "loaded_file_id"
  end

  add_index "features", ["loaded_file_id", "seqid", "feature_type", "start", "end", "strand"], name: "uniq_feature_pos", unique: true, using: :btree
  add_index "features", ["loaded_file_id"], name: "index_features_on_loaded_file_id", using: :btree

  create_table "features_transcripts", force: true do |t|
    t.integer "feature_id"
    t.integer "transcript_id"
  end

  add_index "features_transcripts", ["feature_id"], name: "index_features_transcripts_on_feature_id", using: :btree
  add_index "features_transcripts", ["transcript_id"], name: "index_features_transcripts_on_transcript_id", using: :btree

  create_table "gc_biases", primary_key: "rg_id", force: true do |t|
    t.integer "pct_gc",                        null: false
    t.integer "num_reads",           limit: 8, null: false
    t.integer "num_windows",         limit: 8, null: false
    t.integer "mean_base_quality",             null: false
    t.float   "normalized_coverage",           null: false
    t.float   "error_bar_width",               null: false
  end

  create_table "genes", force: true do |t|
    t.string  "seqid",          limit: nil, null: false
    t.string  "source",         limit: nil, null: false
    t.integer "start",                      null: false
    t.integer "end",                        null: false
    t.string  "strand",         limit: nil, null: false
    t.string  "attr_id",        limit: nil, null: false
    t.string  "gene_name",      limit: nil
    t.integer "loaded_file_id"
  end

  add_index "genes", ["loaded_file_id"], name: "index_genes_on_loaded_file_id", using: :btree

  create_table "genomes", force: true do |t|
    t.string  "name",   limit: nil, null: false
    t.integer "size",   limit: 8
    t.string  "md5sum", limit: nil
  end

  add_index "genomes", ["md5sum"], name: "index_genomes_on_md5sum", unique: true, using: :btree
  add_index "genomes", ["name", "size"], name: "index_genomes_on_name_and_size", unique: true, using: :btree

  create_table "hybrid_selection_metrics", id: false, force: true do |t|
    t.integer "rg_id",                                  null: false
    t.string  "bait_set",                   limit: nil, null: false
    t.integer "genome_size",                limit: 8,   null: false
    t.integer "bait_territory",                         null: false
    t.integer "target_territory",                       null: false
    t.float   "bait_design_efficiency",                 null: false
    t.integer "total_reads",                            null: false
    t.integer "pf_reads",                               null: false
    t.integer "pf_unique_reads",                        null: false
    t.float   "pct_pf_reads",                           null: false
    t.float   "pct_pf_uq_reads",                        null: false
    t.integer "pf_uq_reads_aligned",                    null: false
    t.float   "pct_pf_uq_reads_aligned",                null: false
    t.integer "pf_uq_bases_aligned",                    null: false
    t.integer "on_bait_bases",                          null: false
    t.integer "near_bait_bases",                        null: false
    t.integer "off_bait_bases",                         null: false
    t.integer "on_target_bases",                        null: false
    t.float   "pct_selected_bases",                     null: false
    t.float   "pct_off_bait",                           null: false
    t.float   "on_bait_vs_selected",                    null: false
    t.float   "mean_bait_coverage",                     null: false
    t.float   "mean_target_coverage",                   null: false
    t.float   "pct_usable_bases_on_bait",               null: false
    t.float   "pct_usable_bases_on_target",             null: false
    t.float   "fold_enrichment",                        null: false
    t.float   "zero_cvg_targets_pct",                   null: false
    t.float   "fold_80_base_penalty",                   null: false
    t.float   "pct_target_bases_2x",                    null: false
    t.float   "pct_target_bases_10x",                   null: false
    t.float   "pct_target_bases_20x",                   null: false
    t.float   "pct_target_bases_30x",                   null: false
    t.float   "pct_target_bases_40x"
    t.float   "pct_target_bases_50x"
    t.float   "pct_target_bases_100x"
    t.float   "hs_library_size"
    t.float   "hs_penalty_10x",                         null: false
    t.float   "hs_penalty_20x",                         null: false
    t.float   "hs_penalty_30x",                         null: false
    t.float   "hs_penalty_40x"
    t.float   "hs_penalty_50x"
    t.float   "hs_penalty_100x"
    t.float   "at_dropout",                             null: false
    t.float   "gc_dropout",                             null: false
    t.string  "sample",                     limit: nil
    t.string  "library",                    limit: nil
    t.string  "read_group",                 limit: nil
  end

  add_index "hybrid_selection_metrics", ["rg_id"], name: "index_hybrid_selection_metrics_on_rg_id", using: :btree

  create_table "idx_stats", force: true do |t|
    t.integer "rg_id",                          null: false
    t.string  "sequence_name",      limit: nil, null: false
    t.integer "sequence_length",                null: false
    t.integer "num_mapped_reads",   limit: 8,   null: false
    t.integer "num_unmapped_reads", limit: 8,   null: false
    t.integer "genome_id",                      null: false
  end

  add_index "idx_stats", ["rg_id"], name: "index_idx_stats_on_rg_id", using: :btree

  create_table "insert_sizes", primary_key: "rg_id", force: true do |t|
    t.integer "insert_size",           null: false
    t.integer "fr_count",    limit: 8, null: false
    t.integer "rf_count",    limit: 8
  end

  add_index "insert_sizes", ["rg_id"], name: "in_rg_id", using: :btree

  create_table "libraries", force: true do |t|
    t.integer  "run_id",                          null: false
    t.string   "library",             limit: nil, null: false
    t.string   "barcode",             limit: nil, null: false
    t.string   "sample",              limit: nil, null: false
    t.string   "project",             limit: nil
    t.date     "library_date"
    t.string   "library_prep_method", limit: nil
    t.float    "input_ng"
    t.string   "shearing_method",     limit: nil
    t.integer  "avg_insert_size"
    t.integer  "max_insert_size"
    t.integer  "min_insert_size"
    t.text     "notes"
    t.integer  "pcr_cycles"
    t.integer  "pcr_annealing_sec"
    t.integer  "pcr_annealing_deg"
    t.integer  "pcr_extension_sec"
    t.integer  "pcr_extension_deg"
    t.date     "naoh_stock_date"
    t.float    "pcr_yield_ng"
    t.float    "pcr_conc_nm"
    t.float    "pcr_volume_ul"
    t.string   "notebook_location",   limit: nil
    t.integer  "genome_id"
    t.string   "genome",              limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_number",      limit: nil
    t.string   "email",               limit: nil
  end

  create_table "library_complexities", id: false, force: true do |t|
    t.integer "rg_id",                                  null: false
    t.integer "unpaired_reads_examined",                null: false
    t.integer "read_pairs_examined",                    null: false
    t.integer "unmapped_reads",                         null: false
    t.integer "unpaired_read_duplicates",               null: false
    t.integer "read_pair_duplicates",                   null: false
    t.integer "read_pair_optical_duplicates",           null: false
    t.float   "percent_duplication",                    null: false
    t.integer "estimated_library_size",       limit: 8, null: false
  end

  create_table "library_properties", force: true do |t|
    t.integer  "property_id",               null: false
    t.integer  "library_id",                null: false
    t.string   "raw_value",     limit: nil, null: false
    t.float    "numeric_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "library_properties", ["property_id", "library_id"], name: "index_library_properties_on_property_id_and_library_id", unique: true, using: :btree

  create_table "loaded_files", force: true do |t|
    t.string   "name",       limit: nil, null: false
    t.string   "md5sum",     limit: nil, null: false
    t.string   "file_type",  limit: nil
    t.string   "header",     limit: nil
    t.string   "path",       limit: nil
    t.string   "url",        limit: nil
    t.integer  "genome_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "loaded_files", ["genome_id"], name: "index_loaded_files_on_genome_id", using: :btree

  create_table "observed_taxa", force: true do |t|
    t.integer "rg_id",                    null: false
    t.integer "tax_id",                   null: false
    t.integer "num_reads",    limit: 8
    t.string  "taxon_class",  limit: nil
    t.float   "e_value_min"
    t.float   "e_value_mean"
    t.float   "e_value_max"
  end

  add_index "observed_taxa", ["rg_id"], name: "index_observed_taxa_on_rg_id", using: :btree

  create_table "per_transcript_coverages", force: true do |t|
    t.integer "read_group_id",    null: false
    t.integer "transcript_id",    null: false
    t.integer "bedgraph_file_id", null: false
    t.integer "tot_nof_bins",     null: false
    t.integer "bin_idx",          null: false
    t.float   "mean_coverage"
  end

  add_index "per_transcript_coverages", ["bedgraph_file_id"], name: "index_per_transcript_coverages_on_bedgraph_file_id", using: :btree
  add_index "per_transcript_coverages", ["read_group_id"], name: "index_per_transcript_coverages_on_read_group_id", using: :btree
  add_index "per_transcript_coverages", ["transcript_id"], name: "index_per_transcript_coverages_on_transcript_id", using: :btree

  create_table "properties", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "read_group_properties", force: true do |t|
    t.integer  "property_id",   null: false
    t.integer  "read_group_id", null: false
    t.string   "raw_value",     null: false
    t.float    "numeric_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "read_group_properties", ["property_id", "read_group_id"], name: "index_read_group_properties_on_property_id_and_read_group_id", unique: true, using: :btree

  create_table "read_groups", force: true do |t|
    t.integer  "run_id",                                             null: false
    t.string   "library",                                            null: false
    t.string   "barcode",                                            null: false
    t.string   "sample",                                             null: false
    t.string   "project"
    t.date     "library_date"
    t.string   "library_prep_method"
    t.float    "input_ng"
    t.string   "shearing_method"
    t.integer  "avg_insert_size"
    t.integer  "max_insert_size"
    t.integer  "min_insert_size"
    t.integer  "genome_size",              limit: 8
    t.integer  "num_reads",                limit: 8
    t.text     "notes"
    t.integer  "pcr_cycles"
    t.integer  "pcr_annealing_sec"
    t.integer  "pcr_annealing_deg"
    t.integer  "pcr_extension_sec"
    t.integer  "pcr_extension_deg"
    t.float    "start_library_nm"
    t.float    "final_library_pm"
    t.date     "naoh_stock_date"
    t.string   "contact_email"
    t.float    "pcr_yield_ng"
    t.float    "pcr_conc_nm"
    t.float    "pcr_volume_ul"
    t.string   "notebook_location"
    t.string   "pre_denaturation_buffer"
    t.string   "lane",                                 default: "1", null: false
    t.float    "gc_stat"
    t.integer  "target_bed_group_id"
    t.integer  "num_rrna_reads",           limit: 8
    t.integer  "num_primary_mapped_reads", limit: 8
    t.integer  "genome_id"
    t.string   "genome",                   limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_number",           limit: nil
    t.string   "lot_number",               limit: nil
    t.string   "email",                    limit: nil
    t.integer  "library_id"
  end

  add_index "read_groups", ["genome_id"], name: "index_read_groups_on_genome_id", using: :btree
  add_index "read_groups", ["library"], name: "index_read_groups_library", using: :btree

  create_table "rna_seq_avg_transcript_coverages", id: false, force: true do |t|
    t.integer "rg_id",               null: false
    t.integer "normalized_position", null: false
    t.float   "normalized_coverage", null: false
  end

  add_index "rna_seq_avg_transcript_coverages", ["rg_id"], name: "index_rna_seq_avg_transcript_coverages_on_rg_id", using: :btree

  create_table "rna_seq_metrics", id: false, force: true do |t|
    t.integer "rg_id",                                  null: false
    t.integer "pf_bases",                     limit: 8, null: false
    t.integer "pf_aligned_bases",             limit: 8, null: false
    t.integer "ribosomal_bases",              limit: 8, null: false
    t.integer "coding_bases",                 limit: 8, null: false
    t.integer "utr_bases",                    limit: 8, null: false
    t.integer "intronic_bases",               limit: 8, null: false
    t.integer "intergenic_bases",             limit: 8, null: false
    t.integer "ignored_reads",                limit: 8, null: false
    t.integer "correct_strand_reads",         limit: 8, null: false
    t.integer "incorrect_strand_reads",       limit: 8, null: false
    t.float   "pct_ribosomal_bases",                    null: false
    t.float   "pct_coding_bases",                       null: false
    t.float   "pct_utr_bases",                          null: false
    t.float   "pct_intronic_bases",                     null: false
    t.float   "pct_intergenic_bases",                   null: false
    t.float   "pct_mrna_bases",                         null: false
    t.float   "pct_usable_bases",                       null: false
    t.float   "pct_correct_strand_reads",               null: false
    t.float   "median_cv_coverage",                     null: false
    t.float   "median_5prime_bias",                     null: false
    t.float   "median_3prime_bias",                     null: false
    t.float   "median_5prime_to_3prime_bias",           null: false
  end

  add_index "rna_seq_metrics", ["rg_id"], name: "index_rna_seq_metrics_on_rg_id", using: :btree

  create_table "runs", force: true do |t|
    t.string  "name",                                    null: false
    t.date    "date"
    t.string  "instrument"
    t.string  "instrument_type"
    t.string  "flowcell",                    limit: nil
    t.string  "run_parameters_version",      limit: nil
    t.string  "flowcell_serial_number",      limit: nil
    t.integer "flowcell_part_number"
    t.date    "flowcell_expiration_date"
    t.string  "pr2bottle_serial_number",     limit: nil
    t.integer "pr2bottle_part_number"
    t.date    "pr2bottle_expiration_date"
    t.string  "reagent_kit_serial_number",   limit: nil
    t.integer "reagent_kit_part_number"
    t.date    "reagent_kit_expiration_date"
    t.string  "reagent_kit_version",         limit: nil
    t.string  "run_id",                      limit: nil
    t.string  "scanner_id",                  limit: nil
    t.integer "run_number"
    t.string  "fpga_version",                limit: nil
    t.string  "mcs_version",                 limit: nil
    t.string  "rta_version",                 limit: nil
    t.string  "experiment_name",             limit: nil
    t.string  "chemistry",                   limit: nil
    t.string  "username",                    limit: nil
    t.string  "workflow_analysis",           limit: nil
    t.boolean "enable_analysis"
    t.integer "read_1_size"
    t.integer "index_read_2_size"
    t.integer "read_3_size"
    t.integer "index_read_4_size"
  end

  create_table "transcript_abundances", force: true do |t|
    t.integer "transcript_id", null: false
    t.integer "read_group_id", null: false
    t.float   "rpkm"
    t.float   "tpm"
    t.float   "nof_reads"
    t.float   "coverage_cv"
  end

  add_index "transcript_abundances", ["read_group_id"], name: "index_transcript_abundances_on_read_group_id", using: :btree
  add_index "transcript_abundances", ["transcript_id"], name: "index_transcript_abundances_on_transcript_id", using: :btree

  create_table "transcript_groups", force: true do |t|
    t.string   "name",       limit: nil, null: false
    t.string   "md5sum",     limit: nil, null: false
    t.string   "path",       limit: nil
    t.string   "url",        limit: nil
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "transcripts", force: true do |t|
    t.string  "seqid",          limit: nil, null: false
    t.string  "source",         limit: nil, null: false
    t.integer "start",                      null: false
    t.integer "end",                        null: false
    t.string  "strand",         limit: nil, null: false
    t.string  "attr_id",        limit: nil, null: false
    t.integer "nof_exons"
    t.integer "length"
    t.integer "gene_id"
    t.integer "loaded_file_id"
    t.float   "pct_gc"
    t.float   "delta_g"
    t.float   "delta_g_norm"
    t.string  "probe_homology", limit: nil
  end

  add_index "transcripts", ["gene_id"], name: "index_transcripts_on_gene_id", using: :btree
  add_index "transcripts", ["loaded_file_id", "attr_id"], name: "uniq_transcript_attr_id", unique: true, using: :btree
  add_index "transcripts", ["loaded_file_id"], name: "index_transcripts_on_loaded_file_id", using: :btree

end
