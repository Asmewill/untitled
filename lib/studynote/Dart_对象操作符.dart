// as 类型转换
//
// is 类型判断
//
// .. 级联操作 （连缀） (记住)
class Person {
  String name;
  num age;
  Person(this.name, this.age);
  void printInfo() {
    print("${this.name}---${this.age}");
  }
}
void main(){
  Person p1 = new Person('张三111', 20);
  p1.printInfo();
  p1..name = "李四222"..age = 30..printInfo();
}