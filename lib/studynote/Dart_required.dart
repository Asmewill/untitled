

String printUserInfo(String username, {int age=10, String sex="男"}) {//行参
  return "姓名:$username---性别:$sex--年龄:$age";
}

String printInfo(String username, {required int age, required String sex}) {//行参
  return "姓名:$username---性别:$sex--年龄:$age";
}


void main() {
  print(printUserInfo('张三'));

  print(printUserInfo('张三',age: 20,sex: "女"));

  //age 和 sex必须传入
  print(printInfo('张三',age: 22,sex: "女"));
}
