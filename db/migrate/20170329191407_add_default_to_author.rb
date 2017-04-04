class AddDefaultToAuthor < ActiveRecord::Migration[5.0]
  def change
    change_column_default :tplays, :author, "unknown"
  end
end
