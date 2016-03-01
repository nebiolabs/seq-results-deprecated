class TranscriptAbundance < ActiveRecord::Base
  belongs_to :read_group, :inverse_of => :transcript_abundances
  validates_presence_of :read_group
end
