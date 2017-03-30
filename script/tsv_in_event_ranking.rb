# encoding: utf-8
require 'csv'

EVENT_COUNT = 28

file = [Rails.root, "data", "result", "#{sprintf("%03d", EVENT_COUNT)}.tsv"].join("/")

CSV.open(file, "w:cp932", col_sep: "\t") do |csv|
  csv << ["順位", "ユーザーID", "名前", "RANK", "累計討伐数", "累計貢献度"]
  EventRanking.where(event_count: EVENT_COUNT).order(:ranking).each do |event_ranking|
    csv << [
      event_ranking.ranking,
      event_ranking.user_code,
      event_ranking.name,
      event_ranking.rank,
      event_ranking.total_kill,
      event_ranking.total_contribution
    ]
  end
end


