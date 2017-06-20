require 'test_helper'
require 'nori'

describe Q2 do
  before do
    @feed = Q2.new
    @feed.feed_data = JSON.parse(File.read('test/data/q2.json'))
  end

  it "parses the feed" do
    @feed.translate_feed.must_equal(title: 'Turangalila-symphonie',
                                    composer: 'Olivier Messiaen')
  end
end

describe Counterstream do
  before do
    @feed = Counterstream.new
    @feed.feed_data = JSON.parse(File.read('test/data/counterstream.json'))
  end

  it "parses the feed" do
    @feed.translate_feed.must_equal(title: 'Cadenza On The Night Plain',
                                    composer: 'Terry Riley')
  end
end

describe Earwaves do
  before do
    @feed = Earwaves.new
    @feed.feed_data = Nori.new.parse(File.read('test/data/earwaves.xml'))
  end

  it "parses the feed" do
    @feed.translate_feed.must_equal(
      title: "A Traveller's Dream Journal- Setting A",
      composer: 'David Behrman'
    )
  end
end

describe Yle do
  before do
    @feed = Yle.new
    @feed.feed_data = Nori.new.parse(
      File.read('test/data/yle.xml')
    )
  end

  it "parses the feed" do
    # rubocop:disable LineLength
    @feed.translate_feed.must_equal(title: "An die ferne Geliebte (Kaukaiselle rakastetulle) sarja op.98: ",
                                    composer: 'Beethoven, Ludwig van [1770-1827]')
  end
end
