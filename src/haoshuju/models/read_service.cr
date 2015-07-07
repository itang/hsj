enum ReadStatus
  ToRead
  Reading
  Readed
  Paused
  Finished
end

class Read
  property url, title, status, created_at

  def initialize(@url: String, @title="" : String, @status=ReadStatus::ToRead : ReadStatus, @created_at="" : String)
  end
end

class ReadService
  def find_reads
    [Read.new "http://www.slideshare.net/rolandkuhn/akka-typed-between-session-types-and-the-actor-model",
              title: "Akka Typed — between Session Types and the Actor Model",
              created_at: "2015-07-07 22:35"]
  end
end
