# frozen_string_literal: true

# app/models/invitation.rb
class Invitation < ApplicationRecord
  enum status: %i[pending sent accepted], _default: 'pending'

  belongs_to :referrer, class_name: 'User', foreign_key: :referred_by

  validates :email, presence: true, uniqueness: true

  after_create :invite_user, :update_invitation_status

  private

  def update_invitation_status
    update(status: :sent)
  end

  def invite_user
    InvitationMailer.referral_mail(id).deliver_now
  end
end
