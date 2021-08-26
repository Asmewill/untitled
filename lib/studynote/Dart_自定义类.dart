class Person{
  String? name="张三";
  int? age=23;
  void getInfo(){
    print("${this.name}----${this.age}");
  }
  void setInfo(int age){
    this.age=age;
  }
  // Person(int age,String name){//ok
  //   this.age=age;
  //   this.name=name;
  // }
  // Person(this.age,this.name);//ok
   //Person([this.age,this.name]);
   Person({this.age,this.name});//命名参数构造方法
   Person.now( this.name,this.age);
   Person.now1([this.name,this.age]);//可选参数构造方法
  Person.now2({required this.name,this.age});//命名参数构造方法
  //构造函数可以通过this.age,this.name 直接赋值


}

void main(){

  //实例化
  var p1=new Person();
  print(p1.name);
  p1.getInfo();

  //实例化
  Person p2=new Person();
  print(p2.name);
  p2.setInfo(28);
  p2.getInfo();

  Person p3=Person.now("zhangsan", 16);
  p3.getInfo();

  Person p4=Person.now1();

  Person p5=Person.now2(name: "wangwu");


}