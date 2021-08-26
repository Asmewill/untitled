import 'package:untitled/studynote/Dart_Set.dart';

void main(){
    var s=new Set();
    s.add("香蕉");
    s.add("苹果");
    s.add("苹果");
    print(s);

    List myList=['香蕉','苹果','西瓜','香蕉','苹果','香蕉','苹果'];

    var s1=new Set();

    s1.addAll(myList);

    print(s1);  //{香蕉, 苹果, 西瓜}

    print(s1.toList());  //[香蕉, 苹果, 西瓜]


}