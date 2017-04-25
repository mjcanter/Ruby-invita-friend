class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.references :user, index: true
      t.references :inv, index: true

      t.timestamps
    end
  end
end
