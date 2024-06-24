class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :Email

      t.timestamps
    end
  end
end
