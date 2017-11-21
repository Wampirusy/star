module ApplicationHelper
  def menu
    {
      :home => root_path,
      :tournaments => tournaments_path,
    }
  end
  
  def show_errors(type = nil)
    if flash[:errors]
      errors = type ? flash[:errors][type] : flash[:errors]
      
      errors.to_a.join(' & ')
    end
  end
end
