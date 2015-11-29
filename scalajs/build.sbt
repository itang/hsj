name := "hsj"

scalaVersion := "2.11.7"

version := "0.1-SNAPSHOT"

resolvers += "jitpack" at "https://jitpack.io"

libraryDependencies ++= Seq(
  "be.doeraene" %%% "scalajs-jquery" % "0.8.1",
  "com.github.fancellu" % "scalajs-vue" % "v0.1",
  "org.monifu" %%% "minitest" % "0.12" % "test"
)

testFrameworks += new TestFramework("minitest.runner.Framework")

// Turn this project into a Scala.js project by importing these settings

enablePlugins(ScalaJSPlugin)

persistLauncher := true

persistLauncher in Test := false
