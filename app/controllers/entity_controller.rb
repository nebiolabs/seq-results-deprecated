class EntityController < ApplicationController
  respond_to :json

  def destroy_all
    read_group_id = entity_params[:read_group_id]
    read_group = ReadGroup.find(read_group_id)

    puts "whitelist_classes=#{whitelist_classes.inspect};"
    allowed_associations = entity_params[:associations].select do |association|
      whitelist_classes.include?(association.to_sym)
    end

    # TODO 1: change to del/destroy all assoc records; depending on the model; maybe use only 1 master button instead of many for bedgraph and per trx cov; 03/02/16 W;
    status = 501
    allowed_associations.each do |association|

      if read_group.send(association).respond_to?(:delete_all)
        if read_group.send(association).delete_all
          status = 200
        else
          status = 500
        end
      elsif read_group.send(association).respond_to?(:delete)
        if read_group.send(association).delete
          status = 200
        else
          status = 500
        end
      else
        raise("Cannot delete association=#{association.inspect} " +
              "for read_group=#{read_group.inspect}")
      end
    end

    render json: {class: allowed_associations}.to_json, status: status
  end

  private

  def whitelist_classes
    (ReadGroup.reflect_on_all_associations(:has_many).map(&:name) +
     ReadGroup.reflect_on_all_associations(:has_one).map(&:name))
  end

  def entity_params
    params.permit(:read_group_id, :associations => [])
  end
end
