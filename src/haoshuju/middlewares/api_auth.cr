require "amethyst"

module Haoshuju
  module Middlewares
    class ApiAuthMiddleware < Middleware::Base
      AUTH_HEADER_KEY = "AUTH"
      TOKEN_SEPARATOR = ";"

      # TODO load from config(db) or ENV
      @auths = {"test" => {name: "test", client_id: "test", token: "test2015"}}

      def call(request : Http::Request)
        if request.path.starts_with? "/api"
          unless auth?(request.headers[AUTH_HEADER_KEY]?)
            puts "auth not passed!"
            return Response.new(401, "未授权").tap &.header("Content-Type", "text/plain; charset=utf-8")
          else
            puts "auth passed!"
          end
        end

        @app.call(request)
      end

      private def auth?(auth_str : String?) : Bool
        if auth_str
          auth = auth_str.split(TOKEN_SEPARATOR)
          if auth.size == 2
            client_id, token = auth
            a = @auths[client_id]?
            return true if a && a[:token] == token
          end
        end

        false
      end
    end
  end
end
