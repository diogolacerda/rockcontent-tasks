class Board < ActiveRecord::Base
  has_many :tasks
  accepts_nested_attributes_for :tasks, :allow_destroy => true, :reject_if => proc { |attrs| attrs[:name].blank? || attrs[:priority_type_id].blank? || attrs[:task_status_id].blank? }

  validates_presence_of :name

end
