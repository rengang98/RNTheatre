class AddTplayIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :tplay_id, :integer
  end
end
