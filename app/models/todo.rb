class Todo < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?
  validates_presence_of :description

  def set_defaults
    self.priority = 2
    self.done = false
    self.datetime_create = DateTime.current
  end
end
