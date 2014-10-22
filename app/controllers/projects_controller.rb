class ProjectsController < ApplicationController
  respond_to :json

  def index
    @projects = ReadGroup.select(:project).distinct.map{|read_group|
      {id: read_group.project}
    }

    respond_with @projects
  end

end