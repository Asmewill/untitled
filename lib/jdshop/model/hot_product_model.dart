/// result : [{"_id":"5a0425bc010e711234661439","title":"磨砂牛皮男休闲鞋-有属性","cid":"5a042480010e711234661436","price":"688","old_price":"368","pic":"public\\upload\\RinsvExKu7Ed-ocs_7W1DxYO.png","s_pic":"public\\upload\\RinsvExKu7Ed-ocs_7W1DxYO.png_200x200.png"},{"_id":"5a0432f4010e71123466144c","title":"八匹狼羽绒服男--有属性","cid":"59f1e4f49bfd8f3bd030eed9","price":"288","old_price":"588","pic":"public\\upload\\agbBbaTUWBnWD7pYQOyJsNgJ.png","s_pic":"public\\upload\\agbBbaTUWBnWD7pYQOyJsNgJ.png_200x200.png"},{"_id":"5a07ef1fad8b300e28e2feb6","title":"联想(Lenovo)拯救者R720 15.6英寸游戏笔记本电脑","cid":"59f1e4919bfd8f3bd030eed6","price":"5345","old_price":"5345","pic":"public\\upload\\4i2vxChhbbz2qJMYEUGWw8g_.jpg","s_pic":"public\\upload\\4i2vxChhbbz2qJMYEUGWw8g_.jpg_200x200.jpg"},{"_id":"5a07ef64ad8b300e28e2feb8","title":"神舟（HASEE）战神K650D-G4D2 15.6英寸游戏笔记本电脑","cid":"59f1e4919bfd8f3bd030eed6","price":"4500","old_price":"4500","pic":"public\\upload\\iG8QZV0x7Thh8ZFKA3bCTER5.jpg","s_pic":"public\\upload\\iG8QZV0x7Thh8ZFKA3bCTER5.jpg_200x200.jpg"},{"_id":"5a07efe9ad8b300e28e2febb","title":"戴尔DELL灵越游匣Master15-R4645R 15.6英寸游戏笔记本电脑","cid":"59f1e4919bfd8f3bd030eed6","price":5677,"old_price":"6778","pic":"public\\upload\\YUv6N37Lriv7QK7WePQmyz-u.jpg","s_pic":"public\\upload\\YUv6N37Lriv7QK7WePQmyz-u.jpg_200x200.jpg"},{"_id":"5a080a05ad8b300e28e2fec1","title":"小米 红米Note5A 全网通版 2GB+16GB 香槟金 移动联通电信4G手机 双卡双待","cid":"59f1e4919bfd8f3bd030eed6","price":688,"old_price":"688","pic":"public\\upload\\1X_pUZmj8jQrVrWeiRtoa4Zx.jpg","s_pic":"public\\upload\\1X_pUZmj8jQrVrWeiRtoa4Zx.jpg_200x200.jpg"},{"_id":"5a080a9fad8b300e28e2fec6","title":"荣耀 畅玩6X 4GB 32GB 全网通4G手机 高配版 玫瑰金","cid":"59f1e4919bfd8f3bd030eed6","price":"789","old_price":"11111","pic":"public\\upload\\HSAZYh1vXyzn3kvpso4fs7iT.jpg","s_pic":"public\\upload\\HSAZYh1vXyzn3kvpso4fs7iT.jpg_200x200.jpg"},{"_id":"5a080ac5ad8b300e28e2fec7","title":"三星 Galaxy S7 edge（G9350）4GB+32GB 铂光金 移动联通电信4G手机","cid":"59f1e4919bfd8f3bd030eed6","price":1233,"old_price":"1322","pic":"public\\upload\\SesgdVtaD0RzW2B5NKXcTmEK.jpg","s_pic":"public\\upload\\SesgdVtaD0RzW2B5NKXcTmEK.jpg_200x200.jpg"},{"_id":"5a080b2ead8b300e28e2fec9","title":"小米Max2 全网通 4GB+64GB 金色 移动联通电信4G手机 双卡双待 6.44英寸大","cid":"59f1e4919bfd8f3bd030eed6","price":980,"old_price":"1211","pic":"public\\upload\\e7Z7qLeDpyFjNZMF2Ke1aiTE.jpg","s_pic":"public\\upload\\e7Z7qLeDpyFjNZMF2Ke1aiTE.jpg_200x200.jpg"},{"_id":"5a080c2ead8b300e28e2fed1","title":"锤子 坚果Pro 64GB 酒红色 全网通 移动联通电信4G手机 双卡双待 火热抢购中，","cid":"59f1e4919bfd8f3bd030eed6","price":1456,"old_price":"1468","pic":"public\\upload\\E8jnbcercoZGdllR3r9QN5aD.jpg","s_pic":"public\\upload\\E8jnbcercoZGdllR3r9QN5aD.jpg_200x200.jpg"}]

class HotProductModel {
  List<HotProductItemModel> result=[];

  HotProductModel({required
      this.result});

  HotProductModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(HotProductItemModel.fromJson(v));
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

/// _id : "5a0425bc010e711234661439"
/// title : "磨砂牛皮男休闲鞋-有属性"
/// cid : "5a042480010e711234661436"
/// price : "688"
/// old_price : "368"
/// pic : "public\\upload\\RinsvExKu7Ed-ocs_7W1DxYO.png"
/// s_pic : "public\\upload\\RinsvExKu7Ed-ocs_7W1DxYO.png_200x200.png"

class HotProductItemModel {
  String? id;
  String? title;
  String? cid;
  Object? price;
  String? oldPrice;
  String? pic;
  String? sPic;

  HotProductItemModel({
      this.id, 
      this.title, 
      this.cid, 
      this.price, 
      this.oldPrice, 
      this.pic, 
      this.sPic});

  HotProductItemModel.fromJson(dynamic json) {
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