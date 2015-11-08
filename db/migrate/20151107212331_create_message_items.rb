class CreateMessageItems < ActiveRecord::Migration
  def change
    create_table :message_items do |t|
      t.text :message
      t.integer :poster_id

      t.timestamps null: false
    end
    add_index :message_items, :poster_id
  end
end
