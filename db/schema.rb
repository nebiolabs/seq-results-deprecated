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

ActiveRecord::Schema.define(version: 20140701202346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "alignment_metrics", id: false, force: true do |t|
    t.integer "rg_id",                                null: false
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

  create_table "base_biases", id: false, force: true do |t|
    t.integer "rg_id",                   null: false
    t.integer "read_position",           null: false
    t.integer "num_a",         limit: 8, null: false
    t.integer "num_c",         limit: 8, null: false
    t.integer "num_g",         limit: 8, null: false
    t.integer "num_t",         limit: 8, null: false
    t.integer "num_n",         limit: 8, null: false
    t.integer "num_x",         limit: 8, null: false
  end

  add_index "base_biases", ["rg_id"], name: "in_base_biases_rg_id", using: :btree

  create_table "bed_coverages", id: false, force: true do |t|
    t.integer "rg_id",  null: false
    t.integer "bed_id", null: false
    t.integer "depth"
  end

  add_index "bed_coverages", ["bed_id"], name: "index_bed_coverages_on_bed_id", using: :btree
  add_index "bed_coverages", ["rg_id"], name: "in_bed_cov_rg_id", using: :btree
  add_index "bed_coverages", ["rg_id"], name: "index_bed_coverages_on_rg_id", using: :btree

  create_table "bed_groups", force: true do |t|
    t.string   "name"
    t.string   "md5sum",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bed_groups", ["md5sum"], name: "index_bed_groups_on_md5sum", unique: true, using: :btree
  add_index "bed_groups", ["name"], name: "index_bed_groups_name", using: :btree

  create_table "bed_regions", force: true do |t|
    t.string  "name"
    t.string  "genome"
    t.string  "chr"
    t.integer "start",        limit: 8
    t.integer "end",          limit: 8
    t.integer "bed_group_id",           null: false
    t.float   "frac_gc"
  end

  add_index "bed_regions", ["bed_group_id"], name: "index_bed_regions_on_bed_group_id", using: :btree

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

  create_table "duplicate_reads", id: false, force: true do |t|
    t.integer "rg_id",       null: false
    t.integer "fold_reads",  null: false
    t.float   "fold_unique", null: false
  end

  create_table "gc_biases", id: false, force: true do |t|
    t.integer "rg_id",                         null: false
    t.integer "pct_gc",                        null: false
    t.integer "num_reads",           limit: 8, null: false
    t.integer "num_windows",         limit: 8, null: false
    t.integer "mean_base_quality",             null: false
    t.float   "normalized_coverage",           null: false
    t.float   "error_bar_width",               null: false
  end

  create_table "insert_sizes", id: false, force: true do |t|
    t.integer "rg_id",                 null: false
    t.integer "insert_size",           null: false
    t.integer "fr_count",    limit: 8, null: false
    t.integer "rf_count",    limit: 8
  end

  add_index "insert_sizes", ["rg_id"], name: "in_rg_id", using: :btree

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

  create_table "read_groups", force: true do |t|
    t.integer "run_id",                            null: false
    t.string  "library",                           null: false
    t.string  "barcode",                           null: false
    t.string  "sample",                            null: false
    t.string  "project"
    t.date    "library_date"
    t.string  "library_prep_method"
    t.float   "input_ng"
    t.string  "shearing_method"
    t.integer "avg_insert_size"
    t.integer "max_insert_size"
    t.integer "min_insert_size"
    t.string  "genome"
    t.integer "genome_size",             limit: 8
    t.integer "num_reads",               limit: 8
    t.text    "notes"
    t.integer "pcr_cycles"
    t.integer "pcr_annealing_sec"
    t.integer "pcr_annealing_deg"
    t.integer "pcr_extension_sec"
    t.integer "pcr_extension_deg"
    t.float   "start_library_nm"
    t.float   "final_library_pm"
    t.date    "naoh_stock_date"
    t.string  "contact_email"
    t.float   "pcr_yield_ng"
    t.float   "pcr_conc_nm"
    t.float   "pcr_volume_ul"
    t.string  "notebook_location"
    t.string  "pre_denaturation_buffer"
  end

  create_table "runs", force: true do |t|
    t.string "name",            null: false
    t.date   "date"
    t.string "instrument"
    t.string "instrument_type"
  end

end
