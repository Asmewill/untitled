//Dart中我们也可以在构造函数体运行之前初始化实例变量 （了解）
class Rect{
  int height;
  int width;
  Rect():height=2,width=10{      //Dart类中的初始化列表
    print("${this.height}---${this.width}");
  }
  getArea(){
    return this.height*this.width;
  }
}

void main(){
  Rect r=new Rect();
  print(r.getArea());

}


//Dart类中的初始化列表,构造方法的方法体是empty的
class Rect1{
  int height;
  int width;
  Rect1():
        height=2,
        width=10,
        super();
  getArea(){
    return this.height*this.width;
  }
}