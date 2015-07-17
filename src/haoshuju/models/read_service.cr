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

    read4 = Read.new "http://jsonapi.org/",
              title: "jsonapi spec",
              created_at: "2015-07-17 10:02"

    read5 = Read.new "http://www.jianshu.com/p/0c593988c759",
              title: "JSON API 1.0 核心开发者自述",
              created_at: "2015-07-17 10:03"

    read6 = Read.new "http://blog.scalac.io/2015/07/09/slick-3-overview.html",
              title: "A Quick Overview of Slick 3.0",
              created_at: "2015-07-17 10:18"

    [read1, read2, read3, read4, read5].reverse
  end
end
