class Friendship < ApplicationRecord
  belongs_to :expert, foreign_key: 'expert_id', class_name: 'Expert'
  belongs_to :friend, foreign_key: 'friend_id', class_name: 'Expert'
end
