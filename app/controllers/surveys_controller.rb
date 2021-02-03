class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    puts @survey
  end

  def index
    @surveys = current_user.surveys.all
  end

  def show
    @survey = Survey.find(params[:id])
  end


  def create
    @survey = Survey.new(survey_params)
    @survey.user_id = current_user.id
    if @survey.save!
      redirect_to @survey
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def survey_params
    params.require(:survey).permit(:link)
  end
end
