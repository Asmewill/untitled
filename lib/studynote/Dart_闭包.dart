//1、全局变量特点: 全局变量常驻内存、全局变量污染全局

//2、局部变量的特点： 不常驻内存会被垃圾机制回收、不会污染全局


var a = 123;   //全局变量

void main() {
  print(a);

  fn(){
    a++;
    print(a);
  }
  fn();
  fn();
  fn();

  Function fn1() {
    var a = 123; /*不会污染全局   常驻内存*/
    return () {
      a++;
      print(a);
    };
  }
  var b = fn1();
  b();
  b();
  b();

}