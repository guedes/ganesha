module ApplicationHelper

  def targetable_type
    #OPTIMIZE: measure the impact of this code
    params[:targetable_type] ||
    (params[:script_target] && params[:script_target][:targetable_attributes][:targetable_type]) ||
    (@script_target.targetable_type && @script_target.targetable_type.downcase) ||
    "database"
  end

  def expected_scripts
    if ['database', 'instance'].include?(targetable_type)
      Script.type_is(ScriptType::SQL)
    elsif targetable_type == 'server'
      Script.type_is_not(ScriptType::SQL)
    elsif @script_target.script
      Script.type_is(@script_target.script.type)
    end
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
    if valid_target_type?
      concat(label_tag(targetable_type))
      concat(collection_select(:target, targetable_type, expected_targets, :id, :name, {}, { :class => "select required" , :multiple => true }))
    end
  end
end
