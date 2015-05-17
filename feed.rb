require 'net/http'
require 'json'

class Feed
  attr_accessor :feed_data

  def read_json
    uri = URI(feed_url)
    self.feed_data = JSON.parse(Net::HTTP.get(uri))
  end
end

class Q2 < Feed
  def feed_url
    'http://www.wqxr.org/api/whats_on/q2/2/'
  end

  def parse
    read_json
  end

  def translate_feed
    entry = feed_data['current_playlist_item']['catalog_entry']
    { title: entry['title'], composer: entry['composer']['name'] }
  end
end
