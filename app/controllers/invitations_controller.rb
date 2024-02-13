# frozen_string_literal: true

# app/controllers/invitations_controller.rb
class InvitationsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authorize_request

  def index
    invitations = current_user.sent_invitations
    render json: invitations.as_json, status: :ok
  end

  def create
    invitation = current_user.sent_invitations.new(invitation_params)
    if invitation.save
      render json: invitation.as_json, status: :ok
    else
      render json: { error: 'Failed to create invitation' }, status: 422
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end
end
