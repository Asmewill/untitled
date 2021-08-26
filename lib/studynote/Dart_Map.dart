
void main(){
  //类似JSON对象
  //第一种方式
  Map person={
    "name":"张三",
    "age":20,
    "sex":"男"
  };
  print(person);
  //第二种方式
  var m=new Map();
  m["name"]="李四";
  print(m);

  print(person.keys.toList());
  print(person.values.toList());
  print(person.isEmpty);
  print(person.isNotEmpty);

  person.addAll({
    "work":['敲代码','送外卖'],
    "height":160
  });

  print(person);

  person.remove("sex");

  print(person);

  print(person.containsValue('张三'));


}