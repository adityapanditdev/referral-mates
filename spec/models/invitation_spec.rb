# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe 'for enum status' do
    it { should belong_to(:referrer).class_name('User') }
  end

  describe 'status enum' do
    it 'defines the correct enum values' do
      expect(Invitation.statuses).to eq({ 'pending' => 0, 'sent' => 1, 'accepted' => 2 })
    end

    it "has a default status of 'pending'" do
      invitation = Invitation.new
      expect(invitation.status).to eq('pending')
    end
  end

  describe 'validations' do
    it 'requires presence of email' do
      invitation = Invitation.new
      expect(invitation).to_not be_valid
      expect(invitation.errors[:email]).to include("can't be blank")
    end

    it 'requires uniqueness of email' do
      invitation = Invitation.new(email: 'test@example.com')
      expect(invitation).to_not be_valid
      expect(invitation.errors[:email]).to eq([])
    end
  end
end
