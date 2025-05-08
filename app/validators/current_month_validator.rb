class CurrentMonthValidator < ActiveModel::EachValidator
  def validate_each(record, attr, value)
    record.errors.add(attr, options[:message] || 'should have current month') unless value.month == Date.today.month
  end
end
