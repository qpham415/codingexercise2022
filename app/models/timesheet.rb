class Timesheet < ApplicationRecord
  has_many :line_items, :dependent => :destroy
  accepts_nested_attributes_for :line_items, :allow_destroy => :true, :reject_if => :reject_line_items
end
