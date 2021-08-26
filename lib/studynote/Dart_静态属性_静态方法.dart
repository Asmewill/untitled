class Person {
  static String name = '张三';
  int age=20;
  static void show() {
    print(name);
  }
  void printInfo(){  /*非静态方法可以访问静态成员以及非静态成员*/
    print(name);  //访问静态属性 不要加this
    print(this.age);  //访问非静态属性
    show();   //调用静态方法

  }
  static void printUserInfo(){//静态方法
    print(name);   //静态属性
    show();        //静态方法

   // print(this.age);    //错误：静态方法没法访问非静态的属性
   // this.printInfo();   //错误: 静态方法没法访问非静态的方法
   // printInfo();        //错误:
  }
}

main(){
  print(Person.name);
  Person.show();

  Person.printUserInfo();
}