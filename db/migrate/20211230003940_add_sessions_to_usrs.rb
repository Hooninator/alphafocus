class AddSessionsToUsrs < ActiveRecord::Migration[7.0]
  def change
    add_column :usrs, :sessions, :integer
  end
end
