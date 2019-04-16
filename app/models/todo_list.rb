# TodoList
class TodoList < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true

  scope :pending, -> { where(done: false) }
  scope :completed, -> { where(done: true) }
  scope :group_by_status, -> { TodoList.group(:done).count }
end
