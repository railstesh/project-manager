class CreateCredientials < ActiveRecord::Migration[5.2]
  def change
    create_table :credientials do |t|
      t.string :url
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end
  end
end
