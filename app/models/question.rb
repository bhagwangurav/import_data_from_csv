class Question < ApplicationRecord
  require 'csv'
  belongs_to :teamingStage, optional: true
  belongs_to :role, optional: true
  belongs_to :mapping, optional: true
  
  #import csv data to db
  def self.import(file)
    arrOfMapping = []
    arrOfRole= []
    arrOfTeamingStage = []
    arrOfQuestions = []
    csvRecordCount = CSV.read(file).length
    
    CSV.foreach(file.path, headers: true) do |row|
      csv_data = row.to_hash
      mappingId = 0
      isMappingExist = Mapping.find_by(name: csv_data['Mapping'])
      if(isMappingExist)
        mappingId = isMappingExist.id
      else
        mapping = Mapping.create!(:name => csv_data['Mapping'])
        mappingId = mapping.id
      end

      roleId = 0
      isRoleExist = Role.find_by(name: csv_data['Role'])
      if(isRoleExist)
        roleId = isRoleExist.id
      else
        role = Role.create!(:name => csv_data['Role'])
        roleId = role.id
      end

      teamStageId = 0
      isTeamStageExist = TeamingStage.find_by(name: csv_data['Teaming Stages'])
      if(isTeamStageExist)
        teamStageId = isTeamStageExist.id
      else
        teamStage = TeamingStage.create!(:name => csv_data['Teaming Stages'])
        teamStageId = teamStage.id
      end

      Question.create!(:pri => csv_data['Pri'], :name => csv_data['Question'], :team_stage_id => teamStageId, :appears => csv_data['Appears (Day)'], :frequency =>csv_data['Frequency'], :q_type =>csv_data['Type'], :role_id =>roleId, :required =>csv_data['Required?'], :conditions =>csv_data['Conditions'], :mapping_id =>mappingId)
    end    
  end
end
