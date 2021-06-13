class Health < ApplicationRecord
    # belongs_to :user,foreign_key: "id"

    # validates :date, presence: true
    # validates :temperature_morning, presence: true, length: { maximum: 4 }
    # validates :temperature_night, presence: true, length: { maximum: 4 }
    # validates :user_id, presence: true, uniqueness: { scope: [:date, :user_id] }
end
