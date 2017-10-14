class Todo < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?
  validates_presence_of :description
  enum priority: [:low, :medium, :high]


  def set_defaults
    self.priority = 1
    self.done = false
    self.datetime_create = DateTime.current
  end
end
