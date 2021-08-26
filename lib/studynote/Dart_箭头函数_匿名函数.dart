void main(){
  List list=['苹果','香蕉','西瓜'];
  list.forEach((value){
    print(value);
  });

  list.forEach((value)=>print(value));  //dart箭头函数
  list.forEach((value)=>{  //dart箭头函数
    print(value)
  });

  //箭头函数只有一行
  var list1=[4,1,2,3,4];
  var newList=list1.map((e) => e>2?e*2:e);
  print(newList.toList());

  //dart中定义匿名方法，表示把一个匿名方法赋值给变量printNum
  var printNum=(){
    print(123);
  };
  printNum();

  //dart中定义匿名方法传参：
  var printNum1=(int n){
    print(n+2);
  };
  printNum1(12);
  //kotlin中定义匿名函数
  // var method0:()->unit={
  //
  // }
  // var method1:(String)->unit={str->
  //    println(str)
  // }
  // var method2:(String,String )->unit={str1,str2->
  //    println(str1+str2)
  // }


  //Dart 自执行函数
  ((int n){
    print("我是自执行函数:"+n.toString());
  })(110);


  //Dart中方法的递归
  var sum = 1;
  fn(int n) {
    sum *= n;
    if (n == 1) {
      return;
    }
    fn(n - 1);
  }
  fn(5);
  print(sum);


 //Dart中方法的递归求和
  var sum1=0;
  fn1(int n){
    sum1+=n;
    if(n==0){
      return;
    }
    fn(n-1);
  }
  fn1(100);
  print(sum1);

  var func1=(dynamic n,dynamic m,dynamic k,dynamic l){

  };
  func1(1,2,3,4);


}