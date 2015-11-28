AutoHtml.add_filter(:spotify).with(:width => '100%', :height => 166, :class => "") do |text, options|
  require 'uri'
  require 'net/http'

  if text.match(/(https?:\/\/)?(www\.)?open\.spotify\.com\/track\/\S*/)
    uri = text.split('/')[-1]
    width = options[:width]
    height = options[:height]
    color = options[:color]
    classname = options[:class]
    %{<div class="#{classname}" style="width: #{width}px; height: #{height}px;"><iframe width="#{width}" height="#{height}" scrolling="no" frameborder="no" src="https://embed.spotify.com/?uri=spotify:track:#{new_uri}"></iframe></div>}
  else
  end

  # text.gsub(/(https?:\/\/)?(www.)?open.spotify\.com\/track\/\S*/) do |match|
  #   new_uri = match.to_s
  #   new_uri = (new_uri =~ /^https?\:\/\/.*/) ? URI(new_uri) : URI("http://#{new_uri}")
  #   new_uri.normalize!
  #   width = options[:width]
  #   height = options[:height]
  #   color = options[:color]
  #   classname = options[:class]
  #   %{<div class="#{classname}" style="width: #{width}px; height: #{height}px;"><iframe width="#{width}" height="#{height}" scrolling="no" frameborder="no" src="https://embed.spotify.com/?uri=spotify:track:#{new_uri}"></iframe></div>}
  # end
end
