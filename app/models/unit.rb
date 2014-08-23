#
# This class represents a single unit within a course that a user is taking
#
class Unit < ActiveRecord::Base
  belongs_to :course
  has_many :tests

  belongs_to :lecturer, foreign_key: :lecturer_id

  delegate :name, to: :course, prefix: true, allow_nil: false
end
