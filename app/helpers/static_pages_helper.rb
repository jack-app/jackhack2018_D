module StaticPagesHelper
  def circle_suggest
    code = ""
    current_user.tags.each do |tag|
      code += tag.name
      tag.circles.each do |circle|
        code += circle.name
      end
    end
    code
  end
  private
  def circle_view
  end
end
