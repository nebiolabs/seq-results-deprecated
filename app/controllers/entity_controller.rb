class EntityController < ApplicationController
  respond_to :json

  def destroy_all
    read_group_id = entity_params[:read_group_id]
    read_group = ReadGroup.find(read_group_id)

    puts "whitelist_classes=#{whitelist_classes.inspect};"
    allowed_associations = entity_params[:associations].select do |association|
      whitelist_classes.include?(association.to_sym)
    end

    puts "allowed_associations=#{allowed_associations}"
    
    status = 501
    allowed_associations.each do |association|

      puts "association=#{association.inspect}"
      target_class = association.classify.constantize

      if read_group.send(association).respond_to?(:delete_all)
        puts "use_delete_all_method"
        if read_group.send(association).delete_all
          status = 200
        else
          status = 500
        end
      else
        raise("Cannot destroy or delete_all association=#{association.inspect} " +
              "for read_group=#{read_group.inspect}")
      end
    end

    render json: {class: allowed_associations}.to_json, status: status
  end

  private

  def whitelist_classes
    
    # class_name value must be a symbol here:
    skip_classes = %w(bedgraph_file).map(&:to_sym)
    ReadGroup.reflect_on_all_associations(:has_many).map(&:name).
      reject { |cls| skip_classes.include?(cls) }
  end

  def entity_params
    params.permit(:read_group_id, :associations => [])
  end
end
