class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    brackets_are_empty?(record)
    has_brackets_mistake?(record)
  end


  def brackets_are_empty?(record)
  end

  def has_brackets_mistake?(record)
  end
end
