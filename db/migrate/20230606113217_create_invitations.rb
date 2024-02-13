class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.integer :status
      t.integer :referred_by
      t.string :email

      t.timestamps
    end
  end
end
