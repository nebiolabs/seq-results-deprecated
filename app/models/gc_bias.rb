class GcBias < ActiveRecord::Base
  self.primary_keys = :rg_id, :pct_gc
  belongs_to :read_group, foreign_key: :rg_id

  validates_uniqueness_of :rg_id, :scope => [:pct_gc]
  validates_presence_of :rg_id
  validates_presence_of :pct_gc
  validates_presence_of :num_reads
  validates_presence_of :num_windows
  validates_presence_of :mean_base_quality
  validates_presence_of :normalized_coverage
  validates_presence_of :error_bar_width
end