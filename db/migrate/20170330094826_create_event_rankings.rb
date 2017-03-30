class CreateEventRankings < ActiveRecord::Migration
  def change
    create_table :event_rankings do |t|
      t.integer :event_count, null: false, index: true
      t.integer :ranking, null: false
      t.string :user_code, null: false, index: true
      t.string :name, null: false
      t.integer :rank, null: false, index: true
      t.integer :total_kill, default: 0
      t.integer :total_contribution, default: 0, limit: 8

      t.timestamps null: false
    end
  end
end
