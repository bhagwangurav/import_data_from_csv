class CreateTeamingStages < ActiveRecord::Migration[6.1]
  def change
    create_table :teaming_stages do |t|
      t.string :name

      t.timestamps
    end
  end
end
