#!/usr/bin/ruby

require 'json'
# $stdin.sync = true
# $stdout.sync = true

def alert(message)
  `dunstify dmenu-tabmenu '#{message}'`
end

class Tab
  attr_reader :id, :window, :title, :url, :active
  def initialize(hash)
    @id = hash['id']
    @window = hash['window']
    @title = hash['title']
    @url = hash['url']
    @active = hash['active']
  end

  def option
    "#{id}/#{window} • #{title} • #{url}"
  end
end

while size = $stdin.read(4).unpack("I")[0]
  message = JSON.parse($stdin.read(size))
  tabs = message['tabs'].map { |t| Tab.new(t) }

  dmenu_options = tabs.map(&:option).join("\n")
  result = `echo -e \"#{dmenu_options}\" | dmenu -l 10 -i -p "TAB: "`.strip
  child = tabs.detect { |t| t.option == result }

  if child && !child.active
    message = { id: child.id }.to_json
    $stdout << [message.size].pack("I") << message
    $stdout.flush
  end
end
