val Organization = "net.yoshinorin"

val Name = "akkahttpexample"

val version = "0.0.1"

// Scalaのバージョン
scalaVersion := "2.13.0"

// コンパイラのオプションです
scalacOptions ++= Seq(
  "-deprecation",
  "-feature",
  "-unchecked"
)

libraryDependencies += "com.typesafe.akka" %% "akka-http" % "10.1.8"

libraryDependencies += "com.typesafe.akka" %% "akka-stream" % "2.5.23"

resolvers += "Akka Snapshot Repository" at "https://repo.akka.io/snapshots/"

