class ReadController < BaseController
  actions :index

  @reads = [] of Read

  view "index", "#{__DIR__}/../views/read"

  def index
    @reads = injector.read_service.find_reads
    respond_to do |format|
      format.html { render "index" }
    end
  end
end
