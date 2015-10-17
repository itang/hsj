require "amethyst"

module Haoshuju
  module Middlewares
    class XRuntimeMiddleware < Middleware::Base
      def call(request : Http::Request)
        start = Time.now.ticks
        response = @app.call(request)
        elapsed = Time::Span.new(Time.now.ticks - start).total_milliseconds
        response.headers.add "X-Runtime", elapsed.to_s
        response
      end
    end
  end
end
