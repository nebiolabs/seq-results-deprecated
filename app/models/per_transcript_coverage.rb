class PerTranscriptCoverage < ActiveRecord::Base
  belongs_to :read_group, :inverse_of => :per_transcript_coverages
  belongs_to :bedgraph_file, :inverse_of => :per_transcript_coverages, :dependent => :destroy
  validates_presence_of :read_group
  validates_presence_of :bedgraph_file

  def self.use_destroy_method
    true
  end
end
