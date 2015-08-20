class MakeSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :name
      t.belongs_to :artist, index:true
      t.belongs_to :genre, index:true
    end
  end
end
