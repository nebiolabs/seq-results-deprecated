class BedgraphFile < ActiveRecord::Base
  # Note the singular: read group has one bedgraph file:
  belongs_to :read_group, :inverse_of => :bedgraph_file
  belongs_to :loaded_file, :inverse_of => :bedgraph_files
  # TODO 1: fix in agg res: must be singular :inverse_of => :bedgraph_file ; 03/01/16 T;
  has_many :per_transcript_coverages, :inverse_of => :bedgraph_file, dependent: :destroy
  validates_presence_of :read_group
  validates_presence_of :loaded_file
end
