module Duration
  include ActiveSupport::Concern

  def calculate_time
    date1 = self.created_at.to_date
    date2 = DateTime.now.to_date
    date = date_diff(date1, date2)
    "#{date.first} years, #{date.second} months"
  end

  def date_diff(date1, date2)
    month = (date2.year * 12 + date2.month) - (date1.year * 12 + date1.month)
    month.divmod(12)
  end
end