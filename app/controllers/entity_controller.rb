class EntityController < ApplicationController
  respond_to :json

  def destroy_all
    param_class = entity_params[:class].to_sym
    if whitelist_classes.include?(param_class)
      read_group = ReadGroup.find(entity_params[:read_group_id])
      if read_group.send(param_class).destroy_all
        status = 200
      else
        status = 500
      end
    else
      status = 500
    end

    render json: {class: param_class}.to_json, status: status
  end

  private

  def whitelist_classes
    ReadGroup.reflect_on_all_associations(:has_many).map(&:name)
  end

  def entity_params
    params.permit(:class, :read_group_id)
  end
end