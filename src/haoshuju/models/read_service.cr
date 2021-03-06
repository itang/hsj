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

          rs << Read.new "http://hermanradtke.com/2015/05/03/string-vs-str-in-rust-functions.html",
            title: "String vs &str in Rust functions",
            created_at: "2015-11-02 12:03",
            status: ReadStatus::Readed

          rs << Read.new "http://hermanradtke.com/2015/05/06/creating-a-rust-function-that-accepts-string-or-str.html",
            title: "Creating a Rust function that accepts String or &str",
            created_at: "2015-11-02 11:59",
            status: ReadStatus::Readed

          rs << Read.new "http://hermanradtke.com/2015/05/29/creating-a-rust-function-that-returns-string-or-str.html",
            title: "Creating a Rust function that returns a &str or String",
            created_at: "2015-11-02 12:02",
            status: ReadStatus::Readed

          rs << Read.new "http://axgle.github.io/rhg/",
            title: "Ruby Hacking Guide中文版",
            created_at: "2015-11-02 13:13"

          rs << Read.new "http://mortoray.com/2015/10/21/messy-error-handling-in-rust-with-try/",
            title: "Messy error handling in Rust with `try!` | Musing Mortoray",
            created_at: "2015-11-02 19:21"

          rs << Read.new "https://docs.google.com/presentation/d/1ySMGJqK9yKtx5JX6n7w8j8srkgCC9YdCFKPXKLZ6Fy4/edit#slide=id.g7087fdf69_0_64",
            title: "Rust Lifetimes - Google幻灯片",
            created_at: "2015-11-02 19:31"

          rs << Read.new "https://scotch.io/tutorials/create-a-github-file-explorer-using-vue-js",
            title: "Create a GitHub File Explorer Using Vue.js | Scotch",
            created_at: "2015-11-04 09:41"

          rs << Read.new "http://www.infoq.com/cn/news/2015/11/FiloDB-API-NoSQL",
            title: "FiloDB：用于大数据分析的分布式数据库",
            created_at: "2015-11-07 11:49",
            status: ReadStatus::Readed

          rs << Read.new "https://tiancaiamao.gitbooks.io/go-internals/content/zh/05.5.html",
            title: "抢占式调度 | 深入解析Go",
            created_at: "2015-11-09 12:08"

          rs << Read.new "http://www.randomhacks.net/2015/11/09/bare-metal-rust-cpu-port-io/",
            title: "Bare Metal Rust: Low-level CPU I/O ports",
            created_at: "2015-11-10 10:29"

          rs << Read.new "http://highscalability.com/blog/2015/11/9/a-360-degree-view-of-the-entire-netflix-stack.html",
            title: "A 360 Degree View of the Entire Netflix&nbsp;Stack - High Scalability -",
            created_at: "2015-11-11 10:30"

          rs << Read.new "http://learningelixir.joekain.com/collecing-multiple-streams-in-elixir/",
            title: "Collecting Multiple Streams of Work Into a Pool in Elixir",
            created_at: "2015-11-11 10:35"

          rs << Read.new "https://medium.com/@acidflask/smoothing-data-with-julia-s-generated-functions-c80e240e05f3",
            title: "Smoothing data with Julia’s @generated functions — Medium",
            created_at: "2015-11-11 11:49"

          rs << Read.new "http://leandromoreira.com.br/2015/10/12/how-to-optimize-nginx-configuration-for-http2-tls-ssl/",
            title: "How To Optimize Nginx Configuration for HTTP/2 TLS (SSL) | Leandro Moreira",
            created_at: "2015-11-12 21:40"

          rs << Read.new "http://www-cs-students.stanford.edu/~blynn//haskell/brain.html",
            title: "Haskell - Get a Brain",
            created_at: "2015-11-12 22:01"

          rs << Read.new "http://blog.commoncrawl.org/2015/08/july-2015-crawl-archive-available/",
            title: "Rust: July 2015 Crawl Archive Available &#8211; Common Crawl &#8211; Blog",
            created_at: "2015-11-12 22:43"

          rs << Read.new "https://codecoupled.org/2015/11/10/stack-machine-part-3/",
            title: "Stack machine, part 3 - Burst into flames",
            created_at: "2015-11-13 09:32"

          rs << Read.new "http://www.cultivatehq.com/posts/phoenix-elm-6/",
            title: "Phoenix with Elm - part 6",
            created_at: "2015-11-13 14:06"

          rs << Read.new "http://www.michael-noll.com/blog/2014/05/27/kafka-storm-integration-example-tutorial/",
            title: "Integrating Kafka and Storm: Code Examples and State of the Game - Michael G. Noll",
            created_at: "2015-11-15 12:31"

          rs << Read.new "http://eed3si9n.com/learning-scalaz/",
            title: "learning Scalaz — learning Scalaz",
            created_at: "2015-11-15 19:48"

          rs << Read.new "http://thesecretlivesofdata.com/raft/#home",
            title: "Raft",
            created_at: "2015-11-16 19:44"

          rs << Read.new "https://softwaremill.com/comparing-akka-stream-scalaz-stream/",
            title: "Comparing akka-stream and scalaz-stream with code examples",
            created_at: "2015-11-17 21:00"

          rs << Read.new "https://blog.skcript.com/asynchronous-io-in-rust-36b623e7b965",
            title: "Asynchronous IO in Rust — Sudo vs Root — Medium",
            created_at: "2015-11-17 09:53"

          rs << Read.new "https://blog.twitter.com/2015/building-distributedlog-twitter-s-high-performance-replicated-log-service",
            title: "Building DistributedLog: Twitter’s high-performance replicated log service | Twitter Blogs",
            created_at: "2015-11-23 23:25"

          rs << Read.new "https://github.com/amfe/article/issues/24",
            title: "vue+webpack在“双十一”导购产品的技术实践 · Issue #24 · amfe/article · GitHub",
            created_at: "2015-11-24 23:35"

          rs << Read.new "http://www.confluent.io/blog/apache-kafka-0.9-is-released",
            title: "Apache Kafka 0.9 is Released",
            created_at: "2015-11-25 13:21"

          rs << Read.new "https://github.com/alibaba/jstorm/wiki/JStorm-Chinese-Documentation",
            title: "JStorm Chinese Documentation · alibaba/jstorm Wiki · GitHub",
            created_at: "2015-11-25 21:34"

          rs << Read.new "http://queue.acm.org/detail.cfm?id=2839461",
            title: "Fail at Scale - ACM Queue",
            created_at: "2015-11-25 21:43"

          rs << Read.new "http://mp.weixin.qq.com/s?__biz=MjM5MDE0Mjc4MA==&mid=401389590&idx=1&sn=63c1d56ebea7a128c6b560c4562aa2a8#rd",
            title: "浅析时间序列用户生命周期的聚类方法",
            created_at: "2015-11-30 10:39"

          rs << Read.new "https://linux.cn/article-6658-1.html?utm_source=weibo&utm_medium=weibo",
            title: "对抗拖库 —— Web 前端慢加密-技术 ◆ 学习|Linux.中国-开源社区",
            created_at: "2015-11-30 10:44"

          rs << Read.new "https://wiki.openjdk.java.net/display/Adoption/JDK+9+Outreach",
            title: "JDK 9 Outreach - Adoption -&nbsp;OpenJDK Wiki",
            created_at: "2015-11-30 21:53"

          rs << Read.new "https://auth0.com/blog/2015/11/30/build-an-api-in-rust-with-jwt-authentication-using-nickelrs/",
            title: "Build an API in Rust with JWT Authentication using Nickel.rs",
            created_at: "2015-12-01 09:56"

          rs << Read.new "http://drmingdrmer.github.io/tech/distributed/2015/11/11/paxos-slide.html",
            title: "可靠分布式系统基础 Paxos 的直观解释",
            created_at: "2015-12-06 20:21"

          rs << Read.new "http://blog.premium-minds.com/akka-to-the-rescue/",
            title: "Akka to the rescue • Premium Minds Blog",
            created_at: "2015-12-07 13:06"

          rs << Read.new "http://mariussoutier.com/blog/2015/12/06/playframework-2-4-dependency-injection-di/",
            title: "Playframework 2.4 Dependency Injection (DI) &#124; Marius Soutier",
            created_at: "2015-12-07 22:13"

          rs << Read.new "http://racksburg.com/choosing-an-http-status-code/",
            title: "Choosing an HTTP Status Code — Stop Making It Hard | Racksburg",
            created_at: "2015-12-08 20:19"

          rs << Read.new "http://engineering.wix.com/2015/12/10/scaling-to-100m-mysql-is-a-better-nosql/",
            title: "Scaling to 100M: MySQL is a Better NoSQL | Wix Engineering",
            created_at: "2015-12-11 23:38"

          rs << Read.new "https://medium.com/@ericdreichert/what-one-must-understand-to-be-productive-with-rust-e9e472116728#.u9ivbyult",
            title: "What one must understand to be productive with Rust. — Medium",
            created_at: "2015-12-18 18:00"

          rs << Read.new "http://smallcultfollowing.com/babysteps/blog/2015/12/18/rayon-data-parallelism-in-rust/",
            title: "Rayon: data parallelism in Rust - Baby Steps",
            created_at: "2015-12-19 18:04"

          rs << Read.new "http://www.infoq.com/cn/articles/recommendation-algorithm-overview-part01",
            title: "推荐算法综述（一）",
            created_at: "2015-12-25 13:18"

          rs << Read.new "http://natpryce.com/articles/000815.html",
            title: "Mistaeks I Hav Made: Impressions of Kotlin",
            created_at: "2015-12-27 21:02"

          rs << Read.new "http://os.phil-opp.com/remap-the-kernel.html",
            title: "Remap the Kernel &middot; phil-opp's blog",
            created_at: "2016-01-02 17:31"

          rs << Read.new "https://github.com/shekhargulati/52-technologies-in-2016/blob/master/01-finatra/README.md",
            title: "52-technologies-in-2016/README.md at master · shekhargulati/52-technologies-in-2016 · GitHub",
            created_at: "2016-01-05 11:15"

          rs << Read.new "http://science.raphael.poss.name/rust-for-functional-programmers.html",
            title: "Rust for functional programmers",
            created_at: "2016-01-05 11:20"

          rs << Read.new "http://yq.aliyun.com/articles/2237",
            title: "mysql 高可用方案漫谈（一）-博客-云栖社区",
            created_at: "2016-01-06 12:01"

          rs << Read.new "http://yq.aliyun.com/articles/2238",
            title: "mysql 高可用方案漫谈（二）-博客-云栖社区",
            created_at: "2016-01-06 12:01"

          rs << Read.new "http://yq.aliyun.com/articles/2239",
            title: "mysql 主备复制下的可靠性漫谈（三）-博客-云栖社区",
            created_at: "2016-01-06 12:02"

          rs << Read.new "https://www.ustack.com/blog/kafka/",
            title: "云平台搭建Kafka分布式消息队列服务 | UnitedStack有云",
            created_at: "2016-01-10 11:05"

          rs << Read.new "http://gold.xitu.io/entry/56936f2d60b2c2974cdb48e7",
            title: "稀土掘金：2016 atSwift 大会现场幻灯片、示例代码集合",
            created_at: "2016-01-12 23:02"

          rs << Read.new "http://best-ruby.com/index.html",
            title: "Introduction | Ruby Tricks, Idiomatic Ruby, Refactorings and Best Practices",
            created_at: "2016-01-13 13:22"

          rs << Read.new "https://linux.cn/article-6888-1.html?utm_source=weibo&utm_medium=weibo",
            title: "最简明扼要的 Systemd 教程，只需十分钟-技术 ◆ 学习|Linux.中国-开源社区",
            created_at: "2016-01-14 11:24"

          rs << Read.new "https://www.gitbook.com/book/hintjens/scalable-c/details",
            title: "Scalable C (in progress)  - GitBook",
            created_at: "2016-01-18 13:46"

          rs << Read.new "https://amplab.cs.berkeley.edu/benchmark/",
            title: "Big Data Benchmark",
            created_at: "2016-01-18 22:46"

          rs << Read.new "http://36kr.com/p/5042290.html",
            title: "从0到1：微信后台系统的演进之路_36氪",
            created_at: "2016-01-18 23:07"

          rs << Read.new "http://rubinius.com/2016/01/11/nil-is-not-null-and-other-tales/",
            title: "Rubinius",
            created_at: "2016-01-19 09:58"

          rs << Read.new "http://mp.weixin.qq.com/s?__biz=MzA5Nzc4OTA1Mw==&mid=408091245&idx=1&sn=4bb501acb220c83e1030fe31fae0ef21#rd",
            title: "揭秘全球最大的音乐平台Spotify的运维监控体系",
            created_at: "2016-01-19 23:09"

          rs << Read.new "http://yq.aliyun.com/articles/2920",
            title: "写日志的那些事儿-博客-云栖社区",
            created_at: "2016-01-22 14:02"

          rs << Read.new "http://shipilev.net/blog/2016/arrays-wisdom-ancients/",
            title: "Arrays of Wisdom of the Ancients",
            created_at: "2016-01-26 19:56"

          rs << Read.new "http://blog.rodeo.io/2016/01/24/kudu-as-a-more-flexible-kafka.html?v2",
            title: "Apache Kudu as a More Flexible And Reliable Kafka-style Queue",
            created_at: "2016-01-27 10:19"

          rs << Read.new "https://community.qingcloud.com/topic/336/%E4%B8%8B%E4%B8%80%E4%BB%A3%E8%B6%85%E5%A4%A7%E8%A7%84%E6%A8%A1%E8%BD%AF%E4%BB%B6%E5%AE%9A%E4%B9%89%E7%BD%91%E7%BB%9C%E6%8A%80%E6%9C%AF%E5%AE%9E%E8%B7%B5?from=timeline&isappinstalled=0",
            title: "下一代超大规模软件定义网络技术实践 | 青云QingCloud 社区",
            created_at: "2016-01-29 10:05"

          rs << Read.new "https://medium.com/@eugeniyoz/restful-api-in-rust-impressions-63250d611d15#.j4m56yd5b",
            title: "Rust for Web — Medium",
            created_at: "2016-02-01 23:20"

          rs << Read.new "http://mp.weixin.qq.com/s?__biz=MzA5Nzc4OTA1Mw==&mid=408594607&idx=1&sn=03a5f0bbed230ff726d85ac04bd5305e&scene=4",
            title: "详谈京东的商品搜索系统架构设计",
            created_at: "2016-02-03 09:05"

          rs << Read.new "https://redislabs.com/blog/connecting-spark-and-redis#.VrFcznVSuko",
            title: "Connecting Spark and Redis: A Detailed Look",
            created_at: "2016-02-03 09:51:39"

          rs << Read.new "http://blog.zgtm.de/1",
            title: "blog.zgtm.de",
            created_at: "2016-02-04 21:53"

          rs << Read.new "https://lihaoyi.github.io/post/StrategicScalaStylePrincipleofLeastPower.html",
            title: "Strategic Scala Style: Principle of Least Power",
            created_at: "2016-02-15 10:16"

          rs << Read.new "https://blog.abevoelker.com/why-i-dont-use-docker-much-anymore/",
            title: "Why I don't use Docker much anymore - Abe Voelker",
            created_at: "2016-02-15 10:30"

          rs << Read.new "https://yq.aliyun.com/articles/5590?spm=5176.100238.yqhn2.2.djhcWz",
            title: "数据处理平台架构中的SMACK组合：Spark、Mesos、Akka、Cassandra以及Kafka-博客-云栖社区-阿里云",
            created_at: "2016-02-18 22:08"

          rs << Read.new "http://smallcultfollowing.com/babysteps/blog/2016/02/19/parallel-iterators-part-1-foundations/",
            title: "Parallel Iterators Part 1: Foundations - Baby Steps",
            created_at: "2016-02-20 19:20"

          rs << Read.new "http://devs.cloudimmunity.com/gotchas-and-common-mistakes-in-go-golang/",
            title: "50 Shades of Go: Traps, Gotchas, and Common Mistakes for New Golang Devs",
            created_at: "2016-02-22 17:41"

          rs << Read.new "http://stackoverflow.com/questions/500607/what-are-the-lesser-known-but-useful-data-structures",
            title: "language agnostic - What are the lesser known but useful data structures? - Stack Overflow",
            created_at: "2016-02-25 20:36"

          rs << Read.new "http://weibo.com/ttarticle/p/show?id=2309403948698710187414",
            title: "http://weibo.com/ttarticle/p/show?id=2309403948698710187414",
            created_at: "2016-03-03 14:24"

          rs << Read.new "http://smallcultfollowing.com/babysteps/blog/2016/03/02/nice-errors-in-lalrpop/",
            title: "Nice errors in LALRPOP - Baby Steps",
            created_at: "2016-03-03 14:24"

          rs << Read.new "https://jacobmartins.com/2016/02/29/getting-started-with-oauth2-in-go/",
            title: "Getting Started With OAuth2 In Go | Jacob Martin",
            created_at: "2016-03-04 09:33"
        end.reverse
      end
    end
  end
end
