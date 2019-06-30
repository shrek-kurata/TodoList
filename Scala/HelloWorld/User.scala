class User(val name: String, val age: Int)

object User {
    def printUser(user: User) = println(user.name + "" + user.age)
}

object TypeParamSample {
    class TypeParam[T](val t: T) {
        def get: T = this.t
    }

    def main(args: Array[String]): Unit = {
        val stringTypeParam = new TypeParam[String]("test")
        println(stringTypeParam.get)

        val intTypeParam = new TypeParam[Int](1)
        println(intTypeParam.get)
    }
}