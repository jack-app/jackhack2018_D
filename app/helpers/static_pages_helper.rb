module StaticPagesHelper
  def circle_suggest
    code = ""
    current_user.tags.each do |tag|
      code += "<div class='row'><div class='col-12'><div style='background:#1f1f1f;color:#ffffff;padding:5px 15px;'>#{tag.name}</div></div></div>";
      code += "<div class='row'>"
      tag.circles.each do |circle|
        code += circle_view(circle)
      end
      code += "</div>"
    end
    code
  end
  private
  def circle_view(circle)
    code = "<div class='col-6'>"
    code += "<div style='position:relative;width:100%;height:100%'>"
    code += "<a href='/circles/#{circle.id}'>"
    code += "<img src='https://mb.api.cloud.nifty.com/2013-09-01/applications/6aJWFXEYlhr6utde/publicFiles/#{circle.id}.jpg' style='width:100%;height:auto;'>"
    code += "</a>"
    code += "<div style='position:absolute;left:10px;bottom:10px;color:#ffffff;font-size:2em;text-shadow: 0 0 3px black;'>#{circle.name}</div></a>"
    code += "</div>"
    code += "</div>"
    code
  end
end
