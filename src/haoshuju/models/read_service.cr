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

      def initialize(@url : String, @title = "" : String, @status = ReadStatus::ToRead : ReadStatus, @created_at = "" : String)
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

          rs << Read.new "http://www.infoq.com/cn/articles/kafka-analysis-part-3",
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

          rs << Read.new "https://blog.twitter.com/2015/building-distributedlog-twitter-s-high-performance-replicated-log-service",
            title: "Building DistributedLog: Twitter’s high-performance replicated log service | Twitter Blogs",
            created_at: "2015-09-22 21:49"

          rs << Read.new "http://siejkowski.net/typeclasses-in-swift/",
            title: "Road to Mobilization: Typeclasses in Swift, Haskell and Scala",
            created_at: "2015-09-22 21:59"

          rs << Read.new "http://stackoverflow.com/questions/3508077/how-to-define-type-disjunction-union-types/3508555#3508555",
            title: "scala - How to define &quot;type disjunction&quot; (union types)? - Stack Overflow",
            created_at: "2015-09-23 14:00"

          rs << Read.new "http://www.infoq.com/cn/articles/mesos-complex-data-analytics",
            title: "Mesos上的复杂数据分析",
            created_at: "2015-09-25 11:01"

          rs << Read.new "http://alfonsogarciacaro.github.io/fsharp-for-scala-developers/#/",
            title: "F# for Scala Developers",
            created_at: "2015-09-27 09:40"

          rs << Read.new "https://tobert.github.io/pages/als-cassandra-21-tuning-guide.html",
            title: "Al&#39;s Cassandra 2.1 tuning guide",
            created_at: "2015-09-27 09:53"

          rs << Read.new "http://blog.cloudera.com/blog/2015/09/kudu-new-apache-hadoop-storage-for-fast-analytics-on-fast-data/",
            title: "Kudu: New Apache Hadoop Storage for Fast Analytics on Fast Data | Cloudera Engineering Blog",
            created_at: "2015-10-05 10:04"

          rs << Read.new "http://www.datanami.com/2015/10/05/how-uber-uses-spark-and-hadoop-to-optimize-customer-experience/",
            title: "How Uber Uses Spark and Hadoop to Optimize Customer Experience",
            created_at: "2015-10-06 09:22"

          rs << Read.new "http://mp.weixin.qq.com/s?__biz=MjM5NjAxMzgwMA==&mid=208346354&idx=4&sn=539f93892a68cdfe0f231264f3b99f19",
            title: "分布计算 | 大数据机器学习系统研究进展",
            created_at: "2015-10-06 09:53"

          rs << Read.new "https://blog.lateral.io/2015/05/full-text-search-in-milliseconds-with-postgresql/",
            title: "Full text search in milliseconds with PostgreSQL - Lateral",
            created_at: "2015-10-07 08:47"

          rs << Read.new "http://yahoohadoop.tumblr.com/post/129872361846/large-scale-distributed-deep-learning-on-hadoop",
            title: "Large Scale Distributed Deep Learning on Hadoop... | Hadoop at Yahoo",
            created_at: "2015-10-08 22:42"

          rs << Read.new "http://jlordiales.me/2012/12/13/the-builder-pattern-in-practice/",
            title: "The builder pattern in practice (Java)",
            created_at: "2015-10-11 10:03",
            status: ReadStatus::Readed

          rs << Read.new "https://dzone.com/articles/streaming-big-data-storm-spark",
            title: "Streaming Big Data: Storm, Spark and Samza",
            created_at: "2015-10-12 11:53"

          rs << Read.new "http://gank.io/post/560e15be2dca930e00da1083",
            title: "给 Android 开发者的 RxJava 详解",
            created_at: "2015-10-12 13:16"

          rs << Read.new "https://dzone.com/articles/recipe-rsyslog-redis-logstash-1",
            title: "Recipe: rsyslog + Redis + Logstash",
            created_at: "2015-10-14 09:34"

          rs << Read.new "https://nbaksalyar.github.io/2015/07/10/writing-chat-in-rust.html",
            title: "Rust in Detail: Writing Scalable Chat Service from Scratch",
            created_at: "2015-10-14 16:53"

          rs << Read.new "http://finelydistributed.io/integration-tests-with-docker/",
            title: "Integration Testing with Docker and Scala",
            created_at: "2015-10-13 22:23"

          rs << Read.new "https://medium.com/magnetis-backstage/rust-to-the-rescue-of-ruby-2067f5e1dc25",
            title: "Rust to the rescue (of Ruby) — Magnetis Backstage — Medium",
            created_at: "2015-10-13 22:24",
            status: ReadStatus::Readed

          rs << Read.new "http://www.wbrecom.com/?hmsr=toutiao.io&p=540&utm_medium=toutiao.io&utm_source=toutiao.io",
            title: "微博推荐架构的演进",
            created_at: "2015-10-14 20:40"

          rs << Read.new "http://ricardomartins.cc/2015/10/12/practical_differences_between_rust_closures_and_functions/",
            title: "Practical differences between Rust closures and functions",
            created_at: "2015-10-14 22:57"

          rs << Read.new "http://slides.com/paulschoenfelder/elixirconf2015-release-management#/",
            title: "Release Management with ExRM and Conform by Paul Schoenfelder",
            created_at: "2015-10-16 18:10"

          rs << Read.new "http://teropa.info/blog/2015/09/10/full-stack-redux-tutorial.html",
            title: "Full-Stack Redux Tutorial",
            created_at: "2015-10-16 18:16"

          rs << Read.new "https://linux.cn/article-6416-1.html?utm_source=weibo&utm_medium=weibo",
            title: "使用 Ansible 高效交付 Docker 容器-技术 ◆ 学习|Linux.中国-开源社区",
            created_at: "2015-10-17 10:20"

          rs << Read.new "http://xyclade.github.io/MachineLearning/?__scoop_post=2d9a89c0-7190-11e5-ae6e-001018304b75&__scoop_topic=1906679",
            title: "Machine Learning for Developers by Mike de Waard",
            created_at: "2015-10-18 09:23"

          rs << Read.new "http://thenewstack.io/building-streaming-data-hub-elasticsearch-kafka-cassandra",
            title: "Building a Streaming Data Hub with Elasticsearch, Kafka and Cassandra",
            created_at: "2015-10-22 16:46"

          rs << Read.new "http://radar.oreilly.com/2015/10/swarm-v-fleet-v-kubernetes-v-mesos.html",
            title: "Swarm v. Fleet v. Kubernetes v. Mesos - O'Reilly Radar",
            created_at: "2015-10-24 00:14"

          rs << Read.new "http://aosabook.org/en/ghc.html",
            title: "The Architecture of Open Source Applications (Volume 2): The Glasgow Haskell Compiler",
            created_at: "2015-10-25 20:22"

          rs << Read.new "http://www.mattkeeter.com/projects/constraints/",
            title: "Constraint Solver - Haskell",
            created_at: "2015-10-26 10:12"
          rs << Read.new "https://pascalhertleif.de/artikel/good-practices-for-writing-rust-libraries/",
            title: "Good Practices for Writing Rust Libraries ",
            created_at: "2015-10-26 10:16"

          rs << Read.new "http://colah.github.io/posts/2015-08-Understanding-LSTMs/",
            title: "Understanding LSTM Networks -- colah's blog",
            created_at: "2015-10-27 09:44"

          rs << Read.new "https://vimeo.com/143572750",
            title: "Fastparse at Parsing@SLE 2015 on Vimeo",
            created_at: "2015-10-27 09:54"

          rs << Read.new "http://chimera.labs.oreilly.com/books/1230000000545/index.html",
            title: "High Performance Browser Networking",
            created_at: "2015-10-30 10:59"

          rs << Read.new "http://jadpole.github.io/arcaders/arcaders-1-9/",
            title: "ArcadeRS 1.9: Main menu",
            created_at: "2015-10-31 09:07"

          rs << Read.new "http://ochrons.github.io/sjs2/",
            title: "Scala.js - Home",
            created_at: "2015-10-31 22:32"

          rs << Read.new "http://pgsqlcn.com/",
            title: "PostgreSQL 数据库文档 &mdash; PostgreSQL 数据库文档",
            created_at: "2015-11-02 10:32"

          rs << Read.new "http://hermanradtke.com/2015/05/06/creating-a-rust-function-that-accepts-string-or-str.html",
            title: "Creating a Rust function that accepts String or &str",
            created_at: "2015-11-02 11:59"
        end.reverse
      end
    end
  end
end
