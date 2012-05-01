class CreateSurveyQuestions < ActiveRecord::Migration
  def self.up
    create_table :survey_questions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :survey_questions
  end
end
