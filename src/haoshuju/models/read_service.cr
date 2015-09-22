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

          rs << Read.new "http://blog.jobbole.com/88766/",
                    title: "深入 Nginx：我们是如何为性能和规模做设计的",
                    created_at: "2015-09-07 09:34"

          rs << Read.new "http://phoenix.thefirehoseproject.com/0.html",
                    title: "Phoenix tutorial",
                    created_at: ""

          rs << Read.new "http://openresty.org/download/agentzh-nginx-tutorials-zhcn.html",
                    title: "agentzh 的 Nginx 教程",
                    created_at: "2015-09-09 21:57"

          rs << Read.new "http://www.jasongj.com/2015/08/09/KafkaColumn4/",
                    title: "Kafka设计解析（四）- Kafka Consumer设计解析",
                    created_at: "2015-09-15 09:52"

          rs << Read.new "https://mcxiaoke.gitbooks.io/rxdocs/content/",
                    title: "ReactiveX文档中文翻译",
                    created_at: "2015-09-15 18:28"

          rs << Read.new "http://www.infoq.com/cn/articles/docker-core-technology-preview/",
                    title: "深入浅出Docker（一）：Docker核心技术预览",
                    created_at: "2015-09-16 19:38"

          rs << Read.new "http://www.infoq.com/cn/articles/docker-command-line-quest",
                    title: "深入浅出Docker（二）：Docker命令行探秘",
                    created_at: "2015-09-16 19:48"

          rs << Read.new "http://www.infoq.com/cn/articles/docker-open-source-road",
                    title: "深入浅出Docker（三）：Docker开源之路",
                    created_at: "2015-09-16 19:49"

          rs << Read.new "http://www.infoq.com/cn/articles/docker-integrated-test-and-deployment",
                    title: "深入浅出Docker（四）：Docker的集成测试部署之道",
                    created_at: "2015-09-16 19:50"

          rs << Read.new "http://www.infoq.com/cn/articles/docker-build-development-environment-based-on-fig",
                    title: "深入浅出Docker（五）：基于Fig搭建开发环境",
                    created_at: "2015-09-16 19:51"

          rs << Read.new "http://www.infoq.com/cn/articles/deploy-your-application-like-google",
                    title: "深入浅出Docker（六）：像谷歌一样部署你的应用",
                    created_at: "2015-09-16 19:52"

          rs << Read.new "https://www.typesafe.com/activator/template/reactive-kafka-scala",
                    title: "Reactive Kafka with Scala",
                    created_at: "2015-09-16 21:23"

          rs << Read.new "http://logallthethings.com/2015/09/15/kafka-by-example-kafka-as-unix-pipes/",
                    title: "Kafka by example: Kafka as Unix Pipes",
                    created_at: "2015-09-16 21:36"

          rs << Read.new "http://di-in-scala.github.io/",
                    title: "Dependency Injection in Scala using MacWire &middot; DI in Scala: guide",
                    created_at: "2015-09-16 22:34"

          rs << Read.new "http://engineering.linkedin.com/kafka/kafka-linkedin-current-and-future",
                    title: "Kafka at LinkedIn: Current and Future | LinkedIn Engineering",
                    created_at: "2015-09-18 09:46"

          rs << Read.new "http://redisinaction.com/",
                    title: "Redis实战 &mdash; Redis 实战",
                    created_at: "2015-09-19 11:38"

          rs << Read.new "http://m4rw3r.github.io/rust-and-monad-trait/",
                    title: "Rust and the Monad trait - Not just higher kinded types &middot; m4rw3r",
                    created_at: "2015-09-19 23:55"

          rs << Read.new "http://ifeve.com/apache-storm/",
                    title: "Apache Storm 官方文档中文版 | 并发编程网 - ifeve.com",
                    created_at: "2015-09-20 15:01"

          rs << Read.new "http://segmentfault.com/a/1190000003758525",
                    title: "深入了解Erlang 垃圾回收机制以及其重要性 - SegmentFault",
                    created_at: "2015-09-22 13:35"

        end.reverse
      end
    end
  end
end
