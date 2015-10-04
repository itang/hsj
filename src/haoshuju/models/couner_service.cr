require "redis"

module Haoshuju::Models
  class PageCounter
    getter sum, daily

    def initialize(@sum, @daily)
    end
  end

  class CounterService
    SUM_KEY = "hsj:counter:sum"
    DAILY_KEY = "hsj:counter:daily"

    def hincr(path, field, redis = client, number = 1)
      # Redis.open do |redis|
      #   redis.command("hincrby", path, field, number)
      # end
      redis.hincrby(path, field, number)
    end

    def hget(path, field, redis = client)
      # Redis.open do |redis|
      #   redis.hget(path, field)
      # end
      redis.hget(path, field)
    end

    def incr(path, redis = client, number = 1)
      redis.incr(path, number)
      # Redis.open do |redis|
      #   redis.incr(path)
      # end
    end

    def get(path, redis = client)
      Redis.open do |redis|
        redis.get(path)
      end
    end

    def incr_pv(page, day = Time.now.to_s("%Y-%m-%d")): PageCounter
      sum = Redis::Future.new
      daily = Redis::Future.new

      responses = client.pipelined do |pipeline|
        hincr(SUM_KEY, page, pipeline)

        dp = "#{DAILY_KEY}:#{page}"
        df = Time.now.to_s("%Y-%m-%d")
        hincr(dp, df, pipeline)

        sum = hget(SUM_KEY, page, pipeline) as Redis::Future
        daily = hget(dp, df, pipeline) as Redis::Future
      end

      PageCounter.new(sum.value, daily.value)
      # sum = incr(SUM_KEY + ":" + page)
      # daily = incr("#{DAILY_KEY}:#{page}:#{Time.now.to_s("%Y-%m-%d")}")
      # PageCounter.new(sum, daily)
    end

    # TODO: 优化
    private def client
      Redis.new
      # Redis::Client.new
    end
  end
end
