class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.text :note
      t.references :category
      t.references :friend
    end
  end
end
