class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    brackets_are_empty?(record)
    has_brackets_mistake?(record)
  end


  def brackets_are_empty?(record)
    empty_bracket = record.title.include? '()'
    if empty_bracket
      record.errors[:title] << 'has invalid title'
    end
  end

  def has_brackets_mistake?(record)
  end
end
