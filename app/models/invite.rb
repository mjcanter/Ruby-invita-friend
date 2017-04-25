class Invite < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  belongs_to :inv, foreign_key: "inv_id", :class_name  => "User"
end