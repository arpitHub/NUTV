module ApplicationHelper
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "#{sort_direction}" : "reg"
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
  
  def get_id(name)
    found = false
      User.all.each do |u|
        if u.full_name == name
          return u.id
          found = true
        end
      end
    if !found
          return 0
        end
    end
  
end
