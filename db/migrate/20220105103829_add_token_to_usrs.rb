class AddTokenToUsrs < ActiveRecord::Migration[7.0]
  def change
    add_column :usrs, :token, :string
  end
end
