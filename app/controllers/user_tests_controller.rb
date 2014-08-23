class UserTestsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_course

  def take
    
  end

  private

  def find_course
  	@course = Course.first
  end
end