class CreateShorteners < ActiveRecord::Migration
  def change
    create_table :shorteners do |t|
      t.string :long
      t.string :short
      t.integer :user_id
      t.datetime :create

      t.timestamps
    end
  end
end
