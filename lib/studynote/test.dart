//https://www.itying.com/dart/dart14.html
//如果函数内部只有一个表达式，可以省略大括号，使用"=>"箭头函数;
void main(){
    bool isOpen=false;
    const colorList0=["1","2","3"];


   //数字类型(num、int、double) ,没有float, short, long类型
    double pi = 3.141592653;
    int width = 200;
    int height = 300;
    print(width / height);//注意:这里和Kotlin、Java都不一样，两个int类型相除是double类型小数，而不是整除后的整数。
    print(width ~/ height);//注意: 这才是dart整除正确姿势

    print(3.141592653.toStringAsFixed(3)); //3.142 保留有效数字
    print(6.6.floor());//6向下取整
    print((-6.6).ceil()); //-6 向上取整
    print(9.9.ceil()); //10 向上取整
    print(666.6.round()); //667 四舍五入
    print((-666.6).abs()); // 666.6 取绝对值
    print(666.6.toInt()); //666 转化成int,这中toInt、toDouble和Kotlin类似
    print(999.isEven); //false 是否是偶数
    print(999.isOdd); //true 是否是奇数
    print(666.6.toString()); //666.6 转化成字符串

    String url = "https://mrale.ph/dartvm/";

    print(url.split("://")[0]); //字符串分割split方法，类似Java和Kotlin

    print(url.substring(3, 9)); //字符串截取substring方法, 类似Java和Kotlin

    print(url.startsWith("https")); //当前字符串是否以指定字符开头, 类似Java和Kotlin

    print(url.endsWith("/")); //当前字符串是否以指定字符结尾, 类似Java和Kotlin

    print(url.toUpperCase()); //大写, 类似Java和Kotlin

    print(url.toLowerCase()); //小写, 类似Java和Kotlin

    print(url.indexOf("ph")); //获取指定字符的索引位置, 类似Java和Kotlin

    print(url.contains("http")); //字符串是否包含指定字符, 类似Java和Kotlin

    print(url.trim()); //去除字符串的首尾空格, 类似Java和Kotlin

    print(url.length); //获取字符串长度

    print(url.replaceFirst("t", "A")); //替换第一次出现t字符位置的字符

    print(url.replaceAll("m", "M")); //全部替换, 类似Java和Kotlin






}

