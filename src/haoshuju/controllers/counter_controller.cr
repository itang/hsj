require "json"

class CounterController < BaseController
  actions :daily

  @counter_service = injector.counter_service

  def daily
    ret = @counter_service.find_dailys("index")
    json({data: ret})
  end
end
