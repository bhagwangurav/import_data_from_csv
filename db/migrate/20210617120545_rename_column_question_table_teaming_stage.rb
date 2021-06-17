class RenameColumnQuestionTableTeamingStage < ActiveRecord::Migration[6.1]
  def change
    rename_column :questions, :team_stage_id, :teaming_stage_id
  end
end
