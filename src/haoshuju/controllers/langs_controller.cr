class LangsController < BaseController
  actions :sheet

  view "sheet", "#{__DIR__}/../views/langs"
  def sheet
    respond_to do |format|
      format.html { render "sheet" }
    end
  end
end
