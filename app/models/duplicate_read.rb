class DuplicateRead < ActiveRecord::Base
  belongs_to :read_group, foreign_key: :rg_id
  validates_presence_of :fold_reads
  validates_presence_of :fold_unique
end