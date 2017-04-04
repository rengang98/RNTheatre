class AddAuthorToTplay < ActiveRecord::Migration[5.0]
  def change
    add_column :tplays, :author, :string
  end
end
