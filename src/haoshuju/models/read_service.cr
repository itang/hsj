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
    read1 = Read.new "https://scotch.io/tutorials/getting-started-with-vim-an-interactive-guide",
              title: "Getting Started with Vim: An Interactive Guide",
              created_at: "2015-07-08 12:06"
    read2 = Read.new "http://www.slideshare.net/rolandkuhn/akka-typed-between-session-types-and-the-actor-model",
              title: "Akka Typed — between Session Types and the Actor Model",
              created_at: "2015-07-07 22:35"

    read3 = Read.new "http://www.csdn.net/article/2015-07-07/2825148",
              title: "100篇论文 大数据",
              created_at: "2015-07-08 13:00"
    [read1, read2, read3].reverse
  end
end
