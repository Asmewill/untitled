//https://www.itying.com/dart/dart14.html
void main(){
    print("-----------第一种定义Map的方式--------------");
    var person={"name":"张三","age":20};
    print(person);
    print(person["name"]);
    print("-----------第二种定义Map的方式--------------");
    var p=new Map();
    p["name"]="李四";
    p["age"]=22;
    p["work"]=["程序员","送外卖","摆地摊"];
    print(p);


}