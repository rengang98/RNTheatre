class AddNewpriceToTplay < ActiveRecord::Migration[5.0]
  def change
    add_column :tplays, :newprice, :integer
  end
end
