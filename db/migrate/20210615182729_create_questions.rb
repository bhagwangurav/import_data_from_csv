class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :name
      t.integer :team_stage_id
      t.integer :appears
      t.integer :frequency
      t.string :type
      t.integer :role_id
      t.boolean :required
      t.string :conditions
      t.integer :mapping_id

      t.timestamps
    end
  end
end
