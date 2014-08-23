class UnitsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_course

  def index
  	@units = @course.units
  end

  def show
    @unit = Unit.find(params[:id])
  end

  def download_resource
    @unit = Unit.find(params[:id])
    folder = @unit.code = 'SZL 2111' ? 'hiv_aids' : 'communitaction_skills'
    file = "#{Rails.root}/public/reading_materials/#{folder}/lesson_1.txt"
    send_file file, type: 'application/text', x_sendfile: true
  end

  private

  def find_course
  	@course = Course.first
  end 
end