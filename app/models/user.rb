# frozen_string_literal: true

# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :referrer, class_name: 'User', foreign_key: 'referrer_id', optional: true
  has_many :sent_invitations, class_name: 'Invitation', foreign_key: 'referred_by'

  before_create :set_ref_token
  after_create :update_invitation_status

  private

  def update_invitation_status
    Invitation.where(email: email).update(status: 'accepted') if referrer_id
  end

  def set_ref_token
    self.referral_token = SecureRandom.hex(7)
  end
end
