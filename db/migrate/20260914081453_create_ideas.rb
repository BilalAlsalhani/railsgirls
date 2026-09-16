class CreateIdeas < ActiveRecord::Migration[8.1]
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
