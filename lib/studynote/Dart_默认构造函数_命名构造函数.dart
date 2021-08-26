
//默认构造函数只能有1个,命名构造函数可以有多个
//Dart里面构造函数可以写多个,这个时候我需要通过命名构造函数来实现。
class Person{
  late String name;
  late int age;
  //默认构造函数
  // Person(){
  //   print('这是构造函数里面的内容  这个方法在实例化的时候触发');
  // }
  //默认构造函数
  // Person(String name,int age){
  //   this.name=name;
  //   this.age=age;
  // }
  //默认构造函数
  Person(String name,int age,String aa){
    this.name=name;
    this.age=age;
  }
  //命名构造函数
  Person.now() {
    print('我是命名构造函数');
  }
  void printInfo(){
    print("${this.name}----${this.age}");
  }
}

void main(){
  Person p1=new Person('张三',20,"aaa");
  p1.printInfo();
  Person p2=new Person.now();


}