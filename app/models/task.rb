class Task < ActiveRecord::Base
  belongs_to :board
  belongs_to :priority_type
  belongs_to :task_status

  validates_presence_of :name, :priority_type, :task_status
end
