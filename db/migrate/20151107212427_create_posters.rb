class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :name
    end
    add_index :posters, :name
  end
end
