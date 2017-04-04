class ChangeColumnComment < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :commnet, :comment
  end
end
