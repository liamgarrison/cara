class RenameContentToComment < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :content, :comment
  end
end
