class AddPriToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :pri_id, :integer
  end
end
