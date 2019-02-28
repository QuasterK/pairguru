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
    stack  = []
    lookup_for_brackets = { '(' => ')', '[' => ']', '{' => '}' }
    left_bracket = lookup_for_brackets.keys
    right_bracket = lookup_for_brackets.values

    record.title.each_char do |char|
      if left_bracket.include? char
        stack << char
      elsif right_bracket.include? char
        return record.errors[:title] << 'has invalid title' if stack.empty? || (lookup_for_brackets[stack.pop] != char)
      end
    end
    if !stack.empty?
    record.errors[:title] << 'has invalid title'
    end
  end
end
