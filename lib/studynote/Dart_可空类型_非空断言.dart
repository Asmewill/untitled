void main(){
  String? str="this is str";//null安全
  str=null;
  //print(str!.length);
  printLength(str);
}

void printLength(String? str){
   try{
     print(str!.length);//非空断言！
   }catch(err){
      print("str is null");
   }

}