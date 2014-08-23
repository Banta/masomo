#
# This class represents test that belongs to a use
#
class Test < ActiveRecord::Base
  belongs_to :unit
  has_many :questions
  has_many :user_tests

  delegate :code, to: :unit, prefix: true, allow_nil: false
  delegate :name, to: :unit, prefix: true, allow_nil: false

  def has_been_taken?(user)
  	user_test = user.user_tests.find_by(test_id: id)
  	user_test && user_test.status = 'complete'
  end
end