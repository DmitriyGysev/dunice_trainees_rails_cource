module ApplicationHelper
  def date_formatter(date)
    date.strftime("%A %d %b %Y")
  end
end
