class Rect{
  num height;
  num width;

  Rect(this.height,this.width);
  area(){
    return this.height*this.width;
  }
}
class Rect1{
  late num height;
  late num width;
  Rect1(this.height,this.width);
  get area{    				//dart中定义一个getter
    return this.height*this.width;
  }
  set areaHeight(value){    //dart中定义一个setter
    this.height=value;
  }
}

void main(){
  // Dart不使用getter和setter修饰符的例子
  // 定义一个Rect 类，在初始化构造函数的时候可以传入宽度高度，调用area方法可以计算面积。
  Rect r=new Rect(10,4);
  print("面积:${r.area()}");
  // Dart中使用getter和setter修饰符的例子
  // 定义一个Rect 类，在初始化构造函数的时候可以传入宽度高度，调用areaHeight 可以设置属性的值，调用area可以获取值

  Rect1 r1=new Rect1(10,4);
  r1.areaHeight=6;   //意调用直接通过访问属性的方式访问areaHeight
  print(r1.area);    //注意调用直接通过访问属性的方式访问area
}