module Haoshuju::Runtime
  extend self

  def run_mode
    ENV["RUN_MODE"]? || "production" # development | production
  end

  def dev?
    run_mode == "development"
  end

  def prod?
    run_mode == "production"
  end
end
