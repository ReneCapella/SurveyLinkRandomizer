class ParticipantsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :set_user

  def new
    @participant = Participant.new
    render '/participants/new'
  end

  def create
    @participant = Participant.new(participant_params)
    @participant.user_id = @user.id
    @participant.survey_id = @user.surveys.sample.id

    if @participant.save
      redirect_to user_path(id: @user.id, participant_id: @participant.id)
    else
      render '/participants/new'
    end
  end


  private

  def participant_params
    params.require(:participant).permit(:unique_id, :user_id, :survey_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
