class AddUniqueToEventRankings < ActiveRecord::Migration
  def change
    add_index :event_rankings, [:event_count, :ranking], name: 'idx_to_event', unique: true
  end
end
