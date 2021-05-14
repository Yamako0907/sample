

mixin Mix {
  int wid = 10;
  void foo(){
    print("foo");
  }
}

abstract class Abstract {
  void bar(){
    print("bar");
  }
}

class Empty extends Abstract with Mix{
  void count(){
    int counter = 1;
    print("$counter");
    super.foo();
  }

}

class Om extends Object with Mix{

}

abstract class Factory {

  factory Factory.toString(){
    return DefaultHash();
  }

  factory Factory.toDouble(){
    return Double();
  }

}

class Double implements Factory{
  double count = 100;

  void printDouble(){
    print("$count");
  }
}

class DefaultHash implements Factory{
  void changed(text){
    print("$text");
  }
}