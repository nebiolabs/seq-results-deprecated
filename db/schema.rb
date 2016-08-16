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

ActiveRecord::Schema.define(version: 20160816191829) do

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

  create_table "base_biases", primary_key: "rg_id", force: true do |t|
    t.integer "read_position",           null: false
    t.integer "num_a",         limit: 8, null: false
    t.integer "num_c",         limit: 8, null: false
    t.integer "num_g",         limit: 8, null: false
    t.integer "num_t",         limit: 8, null: false
    t.integer "num_n",         limit: 8, null: false
    t.integer "num_x",         limit: 8, null: false
  end

  create_table "bed_coverages", primary_key: "rg_id", force: true do |t|
    t.integer "bed_id",    null: false
    t.integer "num_reads"
    t.float   "depth"
  end

  add_index "bed_coverages", ["bed_id"], name: "index_bed_coverages_on_bed_id", using: :btree
  add_index "bed_coverages", ["rg_id"], name: "index_bed_coverages_on_rg_id", using: :btree

  create_table "bed_groups", force: true do |t|
    t.string   "name"
    t.string   "md5sum",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bed_groups", ["md5sum"], name: "index_bed_groups_on_md5sum", unique: true, using: :btree

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

  create_table "coverage_depths", primary_key: "rg_id", force: true do |t|
    t.integer "depth",                null: false
    t.string  "chromosome",           null: false
    t.integer "num_bases",  limit: 8
    t.float   "frac_bases"
  end

  create_table "duplicate_groups", id: false, force: true do |t|
    t.integer "rg_id",                       null: false
    t.integer "duplication_group",           null: false
    t.integer "num_reads",         limit: 8, null: false
  end

  create_table "duplicate_reads", primary_key: "rg_id", force: true do |t|
    t.integer "fold_reads",  null: false
    t.float   "fold_unique", null: false
  end

  create_table "gc_biases", primary_key: "rg_id", force: true do |t|
    t.integer "pct_gc",                        null: false
    t.integer "num_reads",           limit: 8, null: false
    t.integer "num_windows",         limit: 8, null: false
    t.integer "mean_base_quality",             null: false
    t.float   "normalized_coverage",           null: false
    t.float   "error_bar_width",               null: false
  end

  create_table "insert_sizes", primary_key: "rg_id", force: true do |t|
    t.integer "insert_size",           null: false
    t.integer "fr_count",    limit: 8, null: false
    t.integer "rf_count",    limit: 8
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
    t.integer "run_id",                                          null: false
    t.string  "library",                                         null: false
    t.string  "barcode",                                         null: false
    t.string  "sample",                                          null: false
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
    t.string  "lane",                              default: "1", null: false
    t.float   "gc_stat"
    t.integer "num_rrna_reads",          limit: 8
  end

  create_table "runs", force: true do |t|
    t.string "name",            null: false
    t.date   "date"
    t.string "instrument"
    t.string "instrument_type"
  end

end
