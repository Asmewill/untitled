//https://www.itying.com/dart/dart16.html

void main(){
  print("------------Dart字符串-------------");
  var str1='this is str1';
  print(str1);
  print("-------------------------");
  var str2='''this is str2
  this is str3
  this is str4
   ''';
  print(str2);
  print("-------------------------");
  var str3="""this is str2
  this is str3
  this is str4""";
  print(str3);
  print("------------Dart数值类型-------------");
  double a=23.5;
  double b=23;
  int c=23;
 // int e=23.4;
  bool f=true;//布尔类型 非boolean
  print("------------Dart 集合类型-------------");
  print("------------第一种定义集合的方式 不指定对应类型-------------");
  var list=["张三",20,true];
  print(list);
  print(list.length);
  print(list[0]);
  print(list[1]);
  print(list[2]);
  print("------------第二种定义集合的方式 指定对应类型-------------");
  var list1=<String>["张三","李四","王五"];
  print(list1);
  print("------------第三种定义集合的方式 指定对应类型-------------");
  var list2=[];
  list2.add("张三");
  list2.add(20);
  list2.add(true);
  print(list2);

  var list3=<String>["张三","李四","王五"];
  list3.add("隔壁老王");
  print(list3);

  var list4=List.filled(2, "");//创建一个固定长度的集合
  print(list4);

  


}