class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.date :birth_date
      t.timestamps
    end
  end
end