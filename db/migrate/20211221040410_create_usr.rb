class CreateUsr < ActiveRecord::Migration[7.0]
  def change
    create_table :usrs do |t|
      t.string :usrname
      t.string :password

      t.timestamps
    end
  end
end
