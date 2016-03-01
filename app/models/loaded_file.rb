class LoadedFile < ActiveRecord::Base
  has_many :bedgraph_files, :inverse_of => :loaded_files
end
