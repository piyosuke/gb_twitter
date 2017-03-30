# encoding: utf-8

EVENT_COUNT = 28

dir = [Rails.root, "data/#{sprintf("%03d", EVENT_COUNT)}"].join("/")

Dir.glob("#{dir}/*").each do |path|
  charset = nil
  html = open(path) do |f|
#    charset = f.charset
    f.read
  end

  doc = Nokogiri::HTML.parse(html, nil, charset)
  doc.xpath('//div[@class="lis-ranking"]').each do |node|
    user_code = node.css('.btn-ranking-profile').attribute("data-location-href").text.split("/").second

    ranking = \
      if node.css('.ico-rank-twodigits').text.present?
        node.css('.ico-rank-twodigits').text.to_i
      elsif node.css('.ico-rank-digits').text.present?
        node.css('.ico-rank-digits').text.to_i
      else
        node.css('.ico-rank').attribute('data-rank').text.to_i
      end

    name = node.css('.txt-name').text
    rank = node.css('.txt-rank').text.gsub(/[^\d]/, "").to_i
    total_kill = node.css('.txt-total-record')[0].css('span').text
    total_contribution = node.css('.txt-total-record')[1].css('span').text

    event_ranking = EventRanking.find_or_initialize_by(
      event_count: EVENT_COUNT,
      ranking: ranking
    )

    event_ranking.user_code = user_code
    event_ranking.name = name
    event_ranking.rank = rank
    event_ranking.total_kill = total_kill
    event_ranking.total_contribution = total_contribution

    event_ranking.save!
  end
end

