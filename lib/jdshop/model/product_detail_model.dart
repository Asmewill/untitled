/// result : {"_id":"59f6a2d27ac40b223cfdcf81","title":"乐扣乐扣(lock&lock)菲特旋转盖轻量杯","cid":"59f1e4919bfd8f3bd030eed6","price":"7621","old_price":"2001","is_best":0,"is_hot":1,"is_new":1,"status":1,"pic":"public\\upload\\iPrQ_-r43nGjFyxYXiMZWTM6.jpg","content":"<p>111乐扣乐扣(lock&amp;lock)菲特旋转盖轻量杯不锈钢保温杯学生杯商务杯情侣杯保冷杯子便携水杯LHC4131WB(450Ml)白蓝<br /></p><p><br /></p><p><img src=\"https://img20.360buyimg.com/vc/jfs/t3178/212/1425374630/276758/f8ed5136/57cce879N17ec3f97.jpg\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-size: 14px; text-align: center;\" alt=\"\" /></p>","cname":"小米","attr":[{"cate":"颜色","list":["红色","白色","黄色"]}],"sub_title":"乐扣乐扣(lock&lock)菲特旋转盖轻量杯不锈钢保温杯学生杯商务杯情侣杯保冷杯子便携水杯LHC4131WB(450Ml)白蓝","salecount":800}

class ProductDetailModel {
 late ProductDetailItemModel? result;

  ProductDetailModel({
      this.result});

  ProductDetailModel.fromJson(dynamic json) {
    result = json['result'] != null ? ProductDetailItemModel.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }

}

/// _id : "59f6a2d27ac40b223cfdcf81"
/// title : "乐扣乐扣(lock&lock)菲特旋转盖轻量杯"
/// cid : "59f1e4919bfd8f3bd030eed6"
/// price : "7621"
/// old_price : "2001"
/// is_best : 0
/// is_hot : 1
/// is_new : 1
/// status : 1
/// pic : "public\\upload\\iPrQ_-r43nGjFyxYXiMZWTM6.jpg"
/// content : "<p>111乐扣乐扣(lock&amp;lock)菲特旋转盖轻量杯不锈钢保温杯学生杯商务杯情侣杯保冷杯子便携水杯LHC4131WB(450Ml)白蓝<br /></p><p><br /></p><p><img src=\"https://img20.360buyimg.com/vc/jfs/t3178/212/1425374630/276758/f8ed5136/57cce879N17ec3f97.jpg\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-size: 14px; text-align: center;\" alt=\"\" /></p>"
/// cname : "小米"
/// attr : [{"cate":"颜色","list":["红色","白色","黄色"]}]
/// sub_title : "乐扣乐扣(lock&lock)菲特旋转盖轻量杯不锈钢保温杯学生杯商务杯情侣杯保冷杯子便携水杯LHC4131WB(450Ml)白蓝"
/// salecount : 800

class ProductDetailItemModel {
  String? id;
  String? title;
  String? cid;
  Object? price;
  String? oldPrice;
  Object? isBest;
  Object? isHot;
  Object? isNew;
  Object? status;
  String pic="";
  String? content;
  String? cname;
  List<Attr> attr=[];
  String? subTitle;
  int? salecount;
  //新增
  int count=1;
  String selectedAttr="";

  ProductDetailItemModel({
      this.id,
      this.title,
      this.cid,
      this.price,
      this.oldPrice,
      this.isBest,
      this.isHot,
      this.isNew,
      this.status,
      this.pic="",
      this.content,
      this.cname,
      required this.attr,
      this.subTitle,
      this.salecount});

  ProductDetailItemModel.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    oldPrice = json['old_price'];
    isBest = json['is_best'];
    isHot = json['is_hot'];
    isNew = json['is_new'];
    status = json['status'];
    pic = json['pic'];
    content = json['content'];
    cname = json['cname'];
    if (json['attr'] != null) {
      attr = [];
      json['attr'].forEach((v) {
        attr?.add(Attr.fromJson(v));
      });
    }
    subTitle = json['sub_title'];
    salecount = json['salecount'];
    count=1;
    selectedAttr="";
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['cid'] = cid;
    map['price'] = price;
    map['old_price'] = oldPrice;
    map['is_best'] = isBest;
    map['is_hot'] = isHot;
    map['is_new'] = isNew;
    map['status'] = status;
    map['pic'] = pic;
    map['content'] = content;
    map['cname'] = cname;
    if (attr != null) {
      map['attr'] = attr?.map((v) => v.toJson()).toList();
    }
    map['sub_title'] = subTitle;
    map['salecount'] = salecount;
    return map;
  }

}

/// cate : "颜色"
/// list : ["红色","白色","黄色"]

class Attr {
  String? cate;
  List<String>? list;
  List<Map> attrList=[];   //自定义的attrList

  Attr({
      this.cate,
      this.list});

  Attr.fromJson(dynamic json) {
    cate = json['cate'];
    list = json['list'] != null ? json['list'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['cate'] = cate;
    map['list'] = list;
    return map;
  }

}