module ApplicationHelper

  def targetable_type
    #OPTIMIZE: measure the impact of this code
    params[:targetable_type] || @targetables.first.first.classify.downcase || @script.data_collectors.first.targetable_type.downcase
  end

  def valid_target_type?
    targetable_type && ['database','instance','server'].include?(targetable_type)
  end

  def expected_targets
    unless valid_target_type?
      Database.order(:name)
    else
      targetable_type.classify.constantize.order(:name)
    end
  end

  def select_by_target_type
    logger.info("select: #{targetable_type}")
    if valid_target_type?
      logger.info("expect: #{expected_targets}")

      concat(label_tag(targetable_type))
      concat(collection_select(:targetables, targetable_type, expected_targets, :id, :name, {}, { :class => "select required" , :multiple => true }))
    end
  end
end
