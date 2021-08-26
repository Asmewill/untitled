// name 可以传入也可以不传入   age必须传入
class Person {
  String? name;   //可空属性
  int age;
  Person({this.name,required this.age});  //表示 name 和age 必须传入

  String getName() {
    return "${this.name}---${this.age}";
  }
}


void main(args) {
  Person p=new Person(
      name: "张三",
      age: 20
  );
  print(p.getName());  //张三---20


  Person p1=new Person(
      age: 20
  );
  print(p1.getName());  //null---20
}