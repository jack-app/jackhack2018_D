module ApplicationHelper
  def set_available_tags_to_gon
    gon.available_tags = Tag.all.pluck(:name)
  end
end
