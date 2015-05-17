require 'test_helper'

describe Q2 do
  before do
    @q2 = Q2.new
    @q2.feed_data = JSON.parse(File.read('test/data/q2.json'))
  end

  it "parses the feed" do
    @q2.translate_feed.must_equal(title: 'Turangalila-symphonie',
                                  composer: 'Olivier Messiaen')
  end
end
