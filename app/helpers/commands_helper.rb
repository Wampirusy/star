module CommandsHelper
  def logo_img command
    image_tag("data:image/gif;base64,#{command.logo}", class: "command_logo")
  end
end
