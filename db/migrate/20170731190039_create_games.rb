class CreateGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.boolean :published
      t.integer :sorting_position
      t.string :title
      t.string :youtube_video_id

      t.timestamps null: false
    end

    Game.create_translation_table(:title, :youtube_video_id)
  end

  def down
    Game.drop_translation_table!

    drop_table :games
  end
end