module ApplicationHelper
  def date_formatter(date)
    date.strftime("%A %S %b %Y")
  end
end
