require 'net/http'
require 'nori'
require 'json'

class Feed
  class << self
    attr_accessor :feed_url, :format

    def feed(url)
      self.feed_url = url
    end

    def feed_format(f)
      self.format = f
    end
  end

  attr_accessor :feed_data

  def format
    self.class.format
  end

  def feed_url
    self.class.feed_url
  end

  def read
    if format == :json
      read_json
    else
      read_xml
    end
  end

  def read_json
    uri = URI(feed_url)
    self.feed_data = JSON.parse(Net::HTTP.get(uri))
  end

  def read_xml
    uri = URI(feed_url)
    self.feed_data = Nori.new.parse(Net::HTTP.get(uri))
  end
end

class Counterstream < Feed
  feed 'http://counterstreamradio.net/admin/services.php?q=current_track'
  feed_format :json

  def translate_feed
    entry = feed_data['TrackInfo']
    { title: entry['Track'], composer: entry['Composer'] }
  end
end

class DroneZone < Feed
  feed 'http://api.somafm.com/recent/dronezone.tre.xml'
  feed_format :xml

  def translate_feed
    entry = feed_data['event']
    { title: entry['title'], composer: entry['artist'] }
  end
end

class Earwaves < Feed
  feed 'http://api.somafm.com/recent/earwaves.tre.xml'
  feed_format :xml

  def translate_feed
    entry = feed_data['event']
    { title: entry['title'], composer: entry['artist'] }
  end
end

class Q2 < Feed
  feed 'http://www.wqxr.org/api/whats_on/q2/2/'
  feed_format :json

  def translate_feed
    entry = feed_data['current_playlist_item']['catalog_entry']
    { title: entry['title'], composer: entry['composer']['name'] }
  end
end

class SecondInversion < Feed
  feed 'http://filesource.abacast.com/king/TRE/inversion2.xml'
  feed_format :xml

  def translate_feed
    entry = feed_data['nexgen_audio_export']['audio']
    { title: entry['title'], composer: entry['composer'] }
  end
end

class Yle < Feed
  feed 'http://yle.fi/radiomanint/LiveXML/r17/item(0).xml'
  feed_format :xml

  def translate_feed
    entry = feed_data['RMPADEXPORT']['ITEM']
    title = entry['@TITLE']
    composer = entry['ROLES']['ROLE'].find { |r| r['ROLE_NAME'] == 'COMPOSER' }
    { title: title, composer: composer['PERSON_NAME'] }
  end
end
