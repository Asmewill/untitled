/// result : [{"_id":"5a0432f4010e71123466144c","title":"八匹狼羽绒服男--有属性","cid":"59f1e4f49bfd8f3bd030eed9","price":"288","old_price":"588","pic":"public\\upload\\agbBbaTUWBnWD7pYQOyJsNgJ.png","s_pic":"public\\upload\\agbBbaTUWBnWD7pYQOyJsNgJ.png_200x200.png"}]

class ProductListModel {
  List<ProductListItemModel> result=[];

  ProductListModel({required
      this.result});

  ProductListModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(ProductListItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "5a0432f4010e71123466144c"
/// title : "八匹狼羽绒服男--有属性"
/// cid : "59f1e4f49bfd8f3bd030eed9"
/// price : "288"
/// old_price : "588"
/// pic : "public\\upload\\agbBbaTUWBnWD7pYQOyJsNgJ.png"
/// s_pic : "public\\upload\\agbBbaTUWBnWD7pYQOyJsNgJ.png_200x200.png"

class ProductListItemModel {
  String? id;
  String? title;
  String? cid;
  Object? price;
  String? oldPrice;
  String pic="";
  String? sPic;

  ProductListItemModel({
      this.id, 
      this.title, 
      this.cid, 
      this.price, 
      this.oldPrice, 
      this.pic="",
      this.sPic});

  ProductListItemModel.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    oldPrice = json['old_price'];
    pic = json['pic'];
    sPic = json['s_pic'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['cid'] = cid;
    map['price'] = price;
    map['old_price'] = oldPrice;
    map['pic'] = pic;
    map['s_pic'] = sPic;
    return map;
  }

}