#
# This class represents the course the user is taking
#
class Course < ActiveRecord::Base
  has_many :units
end
