class SurveysController < ApplicationController
  def index
    @surveys=Survey.all
  end
  def showSurveys
    id=params[:user_id]
    user=User.find_by_id(id.to_i)
    if user.department == user.division
      @surveys=user_survey.find_all_by_division(user.division)
    else
      @surveys=user_survey.find_all_by_department(user.department)
    end
    @survey_list=""
    count=0
    @surveys.each do |s|
      @survey_list=@survey_list + s.survey_name
      if count < @surveys.size -1
         @survey_list=@survey_list + ","
      end
      count=count +1
    end
    respond_to do |format|
      format.html { render :text => @survey_list }
    end
  end  
  def selectSurvey
      @survey = Survey.all  
  end
end
