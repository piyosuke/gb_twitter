class TopsController < ApplicationController
  def index
    @twitter ||= MyTwitter.new
    @twitter.client.search("グラブル", lang: "ja", result_type: 'recent', count: 30)
  end
end
