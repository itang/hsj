module Haoshuju
  module Models
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
        Array(Read).new.tap do |rs|
          rs << Read.new "https://scotch.io/tutorials/getting-started-with-vim-an-interactive-guide",
                    title: "Getting Started with Vim: An Interactive Guide",
                    created_at: "2015-07-08 12:06"

          rs << Read.new "http://www.slideshare.net/rolandkuhn/akka-typed-between-session-types-and-the-actor-model",
                    title: "Akka Typed — between Session Types and the Actor Model",
                    created_at: "2015-07-07 22:35"

          rs << Read.new "http://www.csdn.net/article/2015-07-07/2825148",
                    title: "100篇论文 大数据",
                    created_at: "2015-07-08 13:00"

          rs << Read.new "http://jsonapi.org/",
                    title: "jsonapi spec",
                    created_at: "2015-07-17 10:02"

          rs << Read.new "http://www.jianshu.com/p/0c593988c759",
                    title: "JSON API 1.0 核心开发者自述",
                    created_at: "2015-07-17 10:03"

          rs << Read.new "http://blog.scalac.io/2015/07/09/slick-3-overview.html",
                    title: "A Quick Overview of Slick 3.0",
                    created_at: "2015-07-17 10:18"

          rs << Read.new "https://github.com/jlevy/the-art-of-command-line/blob/master/README-zh.md",
                    title: "命令行的艺术",
                    created_at: "2015-07-18 01:00",
                    status: ReadStatus::Readed

          rs << Read.new "http://learnyousomeerlang.com/content",
                    title: "Learn you some Erlang",
                    created_at: "2015-07-19 20:44"

          rs << Read.new "http://www.infoq.com/cn/articles/kafka-analysis-part-1",
                    title: "Kafka剖析（一）：Kafka背景及架构介绍 ",
                    created_at: "2015-07-30 17:23",
                    status: ReadStatus::Readed

          rs << Read.new "http://www.infoq.com/cn/articles/kafka-analysis-part-2",
                    title: "Kafka设计解析（二）：Kafka High Availability （上）",
                    created_at: "2015-07-30 17:23"

          rs <<  Read.new "http://www.infoq.com/cn/articles/kafka-analysis-part-3",
                    title: "Kafka设计解析（三）：Kafka High Availability （下）",
                    created_at: "2015-07-30 17:23"

          rs << Read.new "http://www.cakesolutions.net/teamblogs/scala-dissection-basic-types",
                    title: "Scala dissection basic types",
                    created_at: "2015-08-06 22:48",
                    status: ReadStatus::Readed

          rs << Read.new "https://leanpub.com/purescript/read#leanpub-auto-installing-purescript",
                    title: "PureScript by Example",
                    created_at: "2015-08-07 14:03"

          rs << Read.new "http://mp.weixin.qq.com/s?__biz=MzAwMDU1MTE1OQ==&mid=209727496&idx=1&sn=86b64ddadcc91bc6b0741a870692b3c0",
                    title: "如何实现支持数亿用户的长连消息系统 | Golang高并发案例 ",
                    created_at: "2015-08-26 09:45"

          rs << Read.new "http://blog.plataformatec.com.br/2015/06/elixir-in-times-of-microservices/",
                    title: "Elixir in times of microservices",
                    created_at: "2015-08-29 09:30"

          rs << Read.new "http://www.infoq.com/cn/presentations/mobile-big-data-platform-architecture-practice",
                    title: "移动大数据平台架构实践",
                    created_at: "2015-08-29 12:00"

          rs << Read.new "http://dockone.io/article/610",
                    title: "Autodesk基于Mesos和Kafka的通用事件系统架构",
                    created_at: "2015-08-30 12:40"

          rs << Read.new "http://andrealeopardi.com/posts/handling-tcp-connections-in-elixir/",
                    title: "Handling TCP connections in Elixir",
                    created_at: "2015-09-04 22:21"

          rs << Read.new "https://engineering.linkedin.com/apache-kafka/how-we%E2%80%99re-improving-and-advancing-kafka-linkedin",
                    title: "advancing-kafka-linkedin",
                    created_at: "2015-09-06 23:23"

          rs << Read.new "https://danielkeep.github.io/practical-intro-to-macros.html",
                    title: "A Practical Intro to Macros in Rust 1.0",
                    created_at: "2015-09-06 23:24"

          rs << Read.new "http://blog.burntsushi.net/rust-error-handling/",
                    title: "Error Handling in Rust",
                    created_at: "2015-09-06 23:25"

          rs << Read.new "http://huonw.github.io/blog/2015/02/some-notes-on-send-and-sync/",
                    title: "Some notes on Send and Sync",
                    created_at: "2015-09-06 23:25"

          rs << Read.new "http://manishearth.github.io/blog/2015/05/27/wrapper-types-in-rust-choosing-your-guarantees/",
                    title: "Wrapper Types in Rust: Choosing Your Guarantees",
                    created_at: "2015-09-06 23:26"
        end.reverse
      end
    end
  end
end
