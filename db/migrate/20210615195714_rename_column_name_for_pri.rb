class RenameColumnNameForPri < ActiveRecord::Migration[6.1]
  def change
    rename_column :questions, :pri_id, :pri
  end
end
