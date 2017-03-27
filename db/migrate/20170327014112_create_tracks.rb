class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.integer :album_id
      t.string :name
      t.string :audio_url
      t.string :image_url

      t.timestamps
    end
  end
end
