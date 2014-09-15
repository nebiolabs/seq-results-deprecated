class EntityController < ApplicationController
  respond_to :json

  def destroy_all
    read_group_id = entity_params[:read_group_id]
    read_group = ReadGroup.find(read_group_id)

    allowed_associations = entity_params[:associations].select do |association|
      whitelist_classes.include?(association.to_sym)
    end

    allowed_associations.each do |association|
      if read_group.send(association).delete_all
        status = 200
      else
        status = 500
      end
    end

    render json: {class: allowed_associations}.to_json, status: status
  end

  private

  def whitelist_classes
    ReadGroup.reflect_on_all_associations(:has_many).map(&:name)
  end

  def entity_params
    params.permit(:read_group_id, :associations => [])
  end
end