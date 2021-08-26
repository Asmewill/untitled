void main(){
  List myList=['香蕉','苹果','西瓜'];

  for(var i=0;i<myList.length;i++){
    print(myList[i]);
  }


  for(var item in myList){
    print(item);
  }


  myList.forEach((value){
    print("$value");
  });


  Map person={
    "name":"张三",
    "age":20
  };

  person.forEach((key,value){
    print("$key---$value");
  });

  List myList1=[1,3,4];
  var newList1=myList1.map((value){
    return "item"+(value*2).toString();
  });
  print(newList1);
  print(newList1.toList());

  List myList2=[1,3,4,5,7,8,9];

  var newList2=myList2.where((value){
    return value>5;
  });
  print(newList2.toList());   //[7, 8, 9]


}