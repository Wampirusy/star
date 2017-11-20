module ApplicationHelper
	def menu
    {
      :home => root_path,
      :tournaments => tournaments_path
    }
  end
end
