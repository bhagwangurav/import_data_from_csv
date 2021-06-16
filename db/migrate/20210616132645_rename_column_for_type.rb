class RenameColumnForType < ActiveRecord::Migration[6.1]
  def change
    rename_column :questions, :type, :q_type
  end
end
