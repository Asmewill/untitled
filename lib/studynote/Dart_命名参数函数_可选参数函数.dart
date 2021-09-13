
//Dart 中定义一个带默认可选参数的方法
String printUserInfo(String username,[String sex='男',int? age]){  //行参

  if(age!=null){
    return "姓名:$username---性别:$sex--年龄:$age";
  }
  return "姓名:$username---性别:$sex--年龄保密";

}
//Dart 中定义一个命名参数的方法
String printUserInfo1(String username,{int? age,String sex='男'}){  //行参

  if(age!=null){
    return "姓名:$username---性别:$sex--年龄:$age";
  }
  return "姓名:$username---性别:$sex--年龄保密";
}


void main(){
  print(printUserInfo('张三'));
  print(printUserInfo('小李','女'));
  print(printUserInfo('小李','女',30));

  print(printUserInfo1('张三'));
  print(printUserInfo1('张三',age:20,sex:'未知'));

//Dart 中实现一个把方法当做参数的方法
  var nimingMethod=(){
    print('我是一个匿名方法');};
//方法
  fn2(method){
    method();
  }
  //调用fn2
  fn2(nimingMethod);


}

