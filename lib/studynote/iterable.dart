//https://www.itying.com/dart/dart14.html
void main(){

  // 使用var声明集合变量--自动推导变量的类型
   List<String> colorList0 = ["red","yellow","blue"];//直接使用[]形式初始化
  // 使用var声明集合变量--自动推导变量的类型
  var  colorList=["red","yellow","blue"];

  print("----------------List集合遍历----------------");
  //forEach遍历
  // colorList.forEach((element) {
  //   print(element);
  // });
  //  //forEach箭头函数遍历
  //  colorList.forEach((element)=>print(element));
  //  for(var i = 0; i < colorList.length; i++) {//可以使用var或int
  //    print(colorList[i]);
  //  }
  //  for(var color in colorList) {
  //    print(color);
  //  }
  //  //while+iterator迭代器遍历，类似Java中的iteator
  //  while(colorList.iterator.moveNext()) {
  //    print(colorList.iterator.current);
  //  }
   colorList.add('white');//和Kotlin类似通过add添加一个新的元素
   print(colorList[2]);//可以类似Kotlin一样，直接使用数组下标形式访问元素
   print(colorList.length);//获取集合的长度，这个Kotlin不一样，Kotlin中使用的是size
   colorList.insert(1, 'black');//在集合指定index位置插入指定的元素
   colorList.removeAt(2);//移除集合指定的index=2的元素，第3个元素
   colorList.clear();//清除所有元素
   print(colorList.sublist(1,3));//截取子集合
   print(colorList.getRange(1, 3));//获取集合中某个范围元素
   print(colorList.join('<--->'));//类似Kotlin中的joinToString方法，输出: red<--->yellow<--->blue<--->green
   print(colorList.isEmpty);
   print(colorList.contains('green'));

   print("----------------Set----------------");
   Set<String> colorSet0= {'red', 'yellow', 'blue', 'green'};//直接使用{}形式初始化
   Set<String> set=new Set();
   var  colorSet1={"red","yellow","blue"};
   var colorSet2 = {'red', 'yellow', 'blue', 'green'};
   colorSet2.add("addvalue");
   colorSet2.remove("red");
   print(colorSet1.intersection(colorSet2));//交集-->输出

   print("----------------Map----------------");
   var map=new Map();//直接创建
   map["red"]=20;//添加元素
   map["yellow"]=25;//添加元素
   map.remove("red");//删除
   var  colorMap={'red':20,'yellow':30,'blue':40};////使用{key:value}形式初始化
   print(colorMap);

   print("----------------Map操作符----------------");
   //map函数的使用
   var result=colorList.map((color) => color+"_type");
   print(result);
   print(result.join(","));
   //list,set,map声明
   //List<String> list=[];
   //Set<String> set={};
   //Map<String,int> map={};
   // 使用var声明集合变量
   // var colorList = ['red', 'yellow', 'blue', 'green'];
   // var colorSet = {'red', 'yellow', 'blue', 'green'};
   // var colorMap = {'white': 0xffffffff, 'black': 0xff000000};









}