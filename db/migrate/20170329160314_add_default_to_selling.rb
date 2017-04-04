class AddDefaultToSelling < ActiveRecord::Migration[5.0]
  def change
    change_column_default :tplays, :selling, "none"
  end
end
