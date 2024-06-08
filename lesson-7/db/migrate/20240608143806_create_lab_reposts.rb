class CreateLabReposts < ActiveRecord::Migration[8.0]
  def change
    create_table :lab_reposts do |t|
      t.string :title
      t.text :description
      t.string :grade

      t.timestamps
    end
  end
end
