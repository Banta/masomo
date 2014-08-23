class TestsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_unit, only: [:index]

  def index
  	@tests = @unit.tests
  end

  def show
    @test = Test.find(params[:id])
  end

  private

  def find_unit
  	@unit = Unit.find(params[:unit_id])
  end
end