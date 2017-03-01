class CreateMyTwitters < ActiveRecord::Migration
  def change
    create_table :my_twitters do |t|

      t.timestamps null: false
    end
  end
end
