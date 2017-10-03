module ApplicationHelper
  def active_menu(name)
    return 'menu-active' if controller_name == name
    nil
  end 
end
