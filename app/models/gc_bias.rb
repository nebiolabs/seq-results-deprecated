class GcBias < ActiveRecord::Base
  belongs_to :read_group, foreign_key: :rg_id

  validates_presence_of :pct_gc
  validates_presence_of :num_reads
  validates_presence_of :num_windows
  validates_presence_of :mean_base_quality
  validates_presence_of :normalized_coverage
  validates_presence_of :error_bar_width
end