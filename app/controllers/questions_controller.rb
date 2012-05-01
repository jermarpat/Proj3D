# app/controllers/questions_controller.rb
class QuestionsController < ApplicationController
  def survey
    @id = cookies.signed[:sid]
    @questions = SurveyQuestions.find_all_by_sid(@id)
  end
  def chooseSurvey
    sname = params[:s_name]
    @survey = Survey.find_by_survey_name(sname)
    if @survey != nil
      @id = @survey.id
      cookies.signed[:sid] = @id
      redirect_to :controller => "questions", :action => "survey"
    else
      @id = 1
    end
  end
  def updateResults
    @show = params
    @responses = Array.new
    @survey = SurveyQuestions.find_all_by_sid(params[:survey_id])
    @survey.each do |s|
      @responses << s.qid
    end
    @values = Array.new
    @responses.each do |r|
      @values << params[r.to_s]
    end
    conn = ActiveRecord::Base.connection
    @responses.each do |r|
      conn.execute("select updateResult(" +
        r.to_s + "," + params[r.to_s] + ")")
    end
		redirect_to :controller => "questions", :action => "chooseSurvey"
		
  end 
  
  def handleCreateSurvey
    q1 = params[:q_1]
    q2 = params[:q_2]
    q3 = params[:q_3]
    q4 = params[:q_4]
    q5 = params[:q_5]
    sname = params[:s_name]
    conn = ActiveRecord::Base.connection
    conn.execute("select addSurvey('" + sname + "','" + q1 + "','" + q2 + "','" + 
      q3 + "','" + q4 + "','" + q5 + "')")
    redirect_to :controller => "questions", :action => "createSurvey"
  end
end
