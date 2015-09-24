class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.boolean :winner, default: false

      t.timestamps
    end
  end
end
