abstract class Animal{
  eat();   //抽象方法
}

class Dog extends Animal{
  @override
  eat() {
    print('小狗在吃骨头');
  }
  run(){
    print('run');
  }
}
class Cat extends Animal{
  @override
  eat() {
    print('小猫在吃老鼠');
  }
  run(){
    print('run');
  }
}


//多态---->子类的实例赋值给父类的引用,只能调用父类里面规定的方法
//多态就是父类定义一个方法不去实现，让继承他的子类去实现，每个子类有不同的表现。
main(){

   Dog d=new Dog();
   d.eat();
   d.run();


   Cat c=new Cat();
   c.eat();
   c.run();


  Animal d1=new Dog();
  d1.eat();
  //d1.run();


  Animal c1=new Cat();
  c1.eat();
 // c1.run()

 // Set<Animal> set=new Set<Dog>();




}