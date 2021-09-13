import 'package:untitled/jdshop/configs/config.dart';

class ImageUtil{

  static getPicUrl(String url){
    var pic=Config.domain+url;
    pic=pic.replaceAll("\\", "/");
    return pic;
  }

}