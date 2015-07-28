class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :given_url
      t.string :slug
      t.string :_slug
      t.integer :clicks,  :default => 0

      t.timestamps
    end
  end
end
