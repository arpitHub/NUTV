module ApplicationHelper
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : "reg"
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
  
  def same_date(event)
    true if event.date.strftime("%d").to_i == (javascript_tag "getOffset()")    
  end
  
end
