import 'package:untitled/studynote/bean/Animal.dart';

// Dart和其他面向对象语言不一样，Data中没有 public private protected这些访问修饰符合
// 但是我们可以使用 _ 把一个属性或者方法定义成私有。
void main(){
  Animal a=new Animal('小狗', 3);

 // print(a._name) //错误：类外部没法访问私有属性

  //a._run() //错误：类外部没法访问私有方法

  print(a.getName());   //正确：通过公有方法访问私有属性

  a.execRun();   //正确：间接的调用私有方法
}