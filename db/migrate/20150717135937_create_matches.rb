class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :uid
      t.string :winner
      t.datetime :started_at
      t.string :mode
      t.string :match_type
      t.string :duration
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
