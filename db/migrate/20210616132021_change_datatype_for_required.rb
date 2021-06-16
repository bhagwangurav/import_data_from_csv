class ChangeDatatypeForRequired < ActiveRecord::Migration[6.1]
  def change
    change_column :questions, :required, :string
  end
end
