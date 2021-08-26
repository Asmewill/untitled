void main(){


  // List里面常用的属性和方法：
  //
  // 常用属性：
  //
  // length 长度
  //
  // reversed 翻转
  //
  // isEmpty 是否为空
  //
  // isNotEmpty 是否不为空
  //
  // 常用方法：
  //
  // add 增加
  //
  // addAll 拼接数组
  //
  // indexOf 查找 传入具体值
  //
  // remove 删除 传入具体值
  //
  // removeAt 删除 传入索引值
  //
  // fillRange 修改
  //
  // insert(index,value); 指定位置插入
  //
  // insertAll(index,list) 指定位置插入List
  //
  // toList() 其他类型转换成List
  //
  // join() List转换成字符串
  //
  // split() 字符串转化成List
  List myList=['香蕉','苹果','西瓜'];

  print(myList.length);   //3

  print(myList.isEmpty);  //false

  print(myList.isNotEmpty);  //true

  print(myList.reversed);     //(西瓜, 苹果, 香蕉)    //对列表倒序排序

  var newMyList=myList.reversed.toList();

  print(newMyList);                  //[西瓜, 苹果, 香蕉]

  //Dart add()增加一个数据:
  List myList1=['香蕉','苹果','西瓜'];
  myList1.add('桃子');   //增加数据  增加一个数据

  //Dart addAll() 拼接数组：
  myList1.addAll(['桃子','葡萄']);  //拼接数组
  print(myList1);
  //Dart indexOf() 查找集合：
  print(myList.indexOf('苹x果'));    //indexOf查找数据 查找不到返回-1  查找到返回索引值

  //Dart remove() removeAt删除集合内容：
  myList1.remove('西瓜');
  myList1.removeAt(1);
  print(myList1);

  //Dart fillRange（） 修改集合：
  List myList2=['香蕉','苹果','西瓜'];
  myList2.fillRange(1, 2,'aaa');  //['香蕉','aaa','西瓜']
  myList2.fillRange(1, 3,'aaa');  //['香蕉','aaa','aaa']
  //Dart insert() insertAll() 集合里面增加数据：指定位置插入数据
  List myList3=['香蕉','苹果','西瓜'];
  myList3.insert(1,'aaa');      //插入  一个   ['香蕉','aaa','苹果','西瓜'];
  myList3.insertAll(1, ['aaa','bbb']);  //插入 多个 ['香蕉','aaa','bbb','苹果','西瓜'];
  print(myList3);
  //Dart join() list转换成字符串:
  List myList4=['香蕉','苹果','西瓜'];
  var str=myList4.join('-');//list转换成字符串
  print(str);//香蕉-苹果-西瓜
  print(str is String);  //true
  //Dart split() 字符串转换成list:
  var str1="香蕉-苹果-西瓜";
  var list=str.split("-");
  print(str is List);  //true

}