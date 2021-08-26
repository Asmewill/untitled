//https://www.itying.com/dart/dart14.html
void main(){
  print("---------三目运算符----------");
  bool flag=true;
  String c=flag?"我是true":"false";
  print("---------??运算符----------");
  var a;
  var b=a??10;//a等于null,把10赋值给b
  print("---------Number类型转换成String类型 toString()------------");
  print("---------String类型转换成Number类型 int.parse()------------");
  String str='123.1';
  var myNum=double.parse(str);
  print(myNum is double);
  print("---------类型转换失败的异常处理 try catch ------------");
  String price='';
  try{
    var myNum=double.parse(price);
    print(myNum);
  }catch(err){
    print("转换异常"+0.toString());
  }
  print("---------for循环------------");
  for(var i=1;i<=10;i++){
    if(i==4){
      continue;  /*跳过当前循环体 然后循环还会继续执行*/
    }
    print(i);
  }
  print("---------二维集合的循环------------");
  List list=[
    {

      "cate":'国内',

      "news":[

        {"title":"国内新闻1"},

        {"title":"国内新闻2"},

        {"title":"国内新闻3"}

      ]

    },

    {

      "cate":'国际',

      "news":[

        {"title":"国际新闻1"},

        {"title":"国际新闻2"},

        {"title":"国际新闻3"}

      ]
    }

  ];
  for(int i=0; i<list.length;i++){
    print("----------------");
    print(list[i]["cate"]);
    for(var j=0;j<list[i]["news"].length;j++){
      print(list[i]["news"][j]["title"]);
    }
  }

  print("---------while 首先判断后执行------------");
  int i=5;
  while(i<10){
     print("执行代码");
     i++;
  }
  print("---------do while 先执行后判断------------");

  int j=1;
  var sum=0;
  do{
    sum+=j;
    j++;
  }while(j<=10);
  print(sum);


}