class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :show]

  def new
    @user = User.new
  end

  def show
    if params[:participant_id]
      user = User.find(params[:id])
      @participant = Participant.find_by_id(params[:participant_id])
      survey = Survey.find(@participant.survey_id)
      @random_survey_link = survey.link
    else
      redirect_to new_user_participant_path(user_id: params[:id])
    end
  end

  def create
   @user = User.new(user_params)
   if @user.save
     session[:user_id] = @user.id
     redirect_to surveys_path
   else
     flash[:warning] = "Please try again"
     redirect_to new_user_path
   end
  end

  private

  def user_params
    params.require(:user).permit(:unique_id, :username, :password)
  end
end
