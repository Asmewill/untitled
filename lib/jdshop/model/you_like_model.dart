/// result : [{"_id":"59f6a2d27ac40b223cfdcf81","title":"乐扣乐扣(lock&lock)菲特旋转盖轻量杯","cid":"59f1e4919bfd8f3bd030eed6","price":"7621","old_price":"2001","pic":"public\\upload\\iPrQ_-r43nGjFyxYXiMZWTM6.jpg","s_pic":"public\\upload\\iPrQ_-r43nGjFyxYXiMZWTM6.jpg_200x200.jpg"},{"_id":"5a042682010e71123466143b","title":"2V341DD7低靴皮带扣细跟中跟鞋","cid":"5a04261e010e71123466143a","price":"188","old_price":"888","pic":"public\\upload\\cPvPwUACxcco6PYXWwhSrkPN.png","s_pic":"public\\upload\\cPvPwUACxcco6PYXWwhSrkPN.png_200x200.png"},{"_id":"5a042702010e71123466143c","title":"茵曼2017冬装新款棒球罗纹领落肩袖丝绒保暖棉衣外套女","cid":"5a0424b8010e711234661437","price":399,"old_price":"1199","pic":"public\\upload\\cRiODeTtSNgcknvzi2rNLq4k.png","s_pic":"public\\upload\\cRiODeTtSNgcknvzi2rNLq4k.png_200x200.png"},{"_id":"5a042aa3010e71123466143d","title":"冬季新品翻毛领中长款纯棉牛仔外套厚款","cid":"5a0424b8010e711234661437","price":"1999","old_price":"1999","pic":"public\\upload\\dTGwzmlZEDu7dHpTjnMuaEPf.png","s_pic":"public\\upload\\dTGwzmlZEDu7dHpTjnMuaEPf.png_200x200.png"},{"_id":"5a042d30010e711234661441","title":"女士尼龙双肩背包 ","cid":"5a04251e010e711234661438","price":3000,"old_price":"3000","pic":"public\\upload\\O7zzbbXDDZH-RTiQ5WlJHBFn.png","s_pic":"public\\upload\\O7zzbbXDDZH-RTiQ5WlJHBFn.png_200x200.png"},{"_id":"5a042eff010e711234661445","title":"澳贝（AUBY） 益智玩具 乖乖小鸭 运动爬行婴幼儿童早教启智声光玩具","cid":"5a042e29010e711234661443","price":88,"old_price":"108","pic":"public\\upload\\ouJ2Ko8Y3fzaVBqhNp284ntA.png","s_pic":"public\\upload\\ouJ2Ko8Y3fzaVBqhNp284ntA.png_200x200.png"},{"_id":"5a07eeeaad8b300e28e2feb5","title":"机械革命(MECHREVO)深海泰坦X6Ti-S(黑曜金)15.6英寸游戏笔记本","cid":"59f1e4919bfd8f3bd030eed6","price":5799,"old_price":"5899","pic":"public\\upload\\bYm5SiQ0tUcNlWzksm8XsO73.jpg","s_pic":"public\\upload\\bYm5SiQ0tUcNlWzksm8XsO73.jpg_200x200.jpg"},{"_id":"5a07ef41ad8b300e28e2feb7","title":"华硕(ASUS) 飞行堡垒三代FX60VM GTX1060 15.6英寸游戏笔记本电脑","cid":"59f1e4919bfd8f3bd030eed6","price":"5699","old_price":"5699","pic":"public\\upload\\09-yRFS8J97pZ3awPOzYWY2q.jpg","s_pic":"public\\upload\\09-yRFS8J97pZ3awPOzYWY2q.jpg_200x200.jpg"},{"_id":"5a07efc3ad8b300e28e2feba","title":"微星(MSI)GL62VR 7RFX-848CN 15.6英寸游戏本","cid":"59f1e4919bfd8f3bd030eed6","price":6456,"old_price":"7456","pic":"public\\upload\\_mqz5JqsZEjnrh7Qui3KfOOO.jpg","s_pic":"public\\upload\\_mqz5JqsZEjnrh7Qui3KfOOO.jpg_200x200.jpg"},{"_id":"5a07efe9ad8b300e28e2febb","title":"戴尔DELL灵越游匣Master15-R4645R 15.6英寸游戏笔记本电脑","cid":"59f1e4919bfd8f3bd030eed6","price":5677,"old_price":"6778","pic":"public\\upload\\YUv6N37Lriv7QK7WePQmyz-u.jpg","s_pic":"public\\upload\\YUv6N37Lriv7QK7WePQmyz-u.jpg_200x200.jpg"}]

class YouLikeModel {
  List<YouLikeItemModel> result=[];

  YouLikeModel({required
      this.result});

  YouLikeModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(YouLikeItemModel.fromJson(v));
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

/// _id : "59f6a2d27ac40b223cfdcf81"
/// title : "乐扣乐扣(lock&lock)菲特旋转盖轻量杯"
/// cid : "59f1e4919bfd8f3bd030eed6"
/// price : "7621"
/// old_price : "2001"
/// pic : "public\\upload\\iPrQ_-r43nGjFyxYXiMZWTM6.jpg"
/// s_pic : "public\\upload\\iPrQ_-r43nGjFyxYXiMZWTM6.jpg_200x200.jpg"

class YouLikeItemModel {
  String? id;
  String title="";
  String? cid;
  Object? price;
  String? oldPrice;
  String? pic;
  String? sPic;

  YouLikeItemModel({
      this.id, 
      this.title="",
      this.cid, 
      this.price, 
      this.oldPrice, 
      this.pic, 
      this.sPic});

  YouLikeItemModel.fromJson(dynamic json) {
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