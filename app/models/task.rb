class Task < ActiveRecord::Base
  belongs_to :board
  belongs_to :priority_type
  belongs_to :task_status

  validates_presence_of :name, :priority_type, :task_status

  scope :to_do, -> { where(task_status_id: 1) }
  scope :in_progress, -> { where(task_status_id: 2) }
  scope :to_verify, -> { where(task_status_id: 3) }
  scope :done, -> { where(task_status_id: 4) }

end
