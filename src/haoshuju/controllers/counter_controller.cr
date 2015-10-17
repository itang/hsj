require "json"

class CounterController < BaseController
  actions :index, :daily

  @counter_service = injector.counter_service

  view "index", "#{__DIR__}/../views/stat"

  def index
    respond_to do |format|
      format.html { render "index" }
    end
  end

  def daily
    ret = @counter_service.find_dailys("index")
    json({data: ret})
  end
end
