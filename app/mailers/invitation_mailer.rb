# frozen_string_literal: true

# app/mailer/invitation_mailer.rb
class InvitationMailer < ApplicationMailer
  def referral_mail(invitation_id)
    @invitation = Invitation.find(invitation_id)
    @referred_by = @invitation.referrer
    mail(to: @invitation.email, subject: "#{@referred_by.email} sent you a referral invitation" )
  end
end
