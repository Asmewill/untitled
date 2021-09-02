/// result : [{"_id":"59f1e1ada1da8b15d42234e9","pic":"","pid":"0","sort":"100","status":"1","title":"电脑办公"},{"_id":"59f1e1e880e7ed050cec999d","pic":"","pid":"0","sort":"100","status":1,"title":"女装内衣"},{"_id":"59f1e4659bfd8f3bd030eed3","pic":"","pid":"0","sort":"100","status":1,"title":"运动户外"},{"_id":"59f1e46e9bfd8f3bd030eed4","pic":"","pid":"0","sort":"100","status":"1","title":"手机数码"},{"_id":"59f1e47e9bfd8f3bd030eed5","pic":"","pid":"0","sort":"100","status":"1","title":"化妆品"},{"_id":"5a04251e010e711234661438","pic":"","pid":"0","sort":"100","status":"1","title":"箱包"},{"_id":"5a04261e010e71123466143a","pic":"","pid":"0","sort":"100","status":1,"title":"女鞋"},{"_id":"5a042e29010e711234661443","pic":"","pid":"0","sort":"100","status":"1","title":"汽车用品"},{"_id":"5a042f27010e711234661446","pic":"","pid":"0","sort":"100","status":"1","title":"酒水饮料"}]

class LeftModel {
  List<LeftItemModel> result=[];

  LeftModel({required
      this.result});

  LeftModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(LeftItemModel.fromJson(v));
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

/// _id : "59f1e1ada1da8b15d42234e9"
/// pic : ""
/// pid : "0"
/// sort : "100"
/// status : "1"
/// title : "电脑办公"

class LeftItemModel {
  String? id;
  String? pic;
  String? pid;
  String? sort;
  Object? status;
  String? title;

  LeftItemModel({
      this.id, 
      this.pic, 
      this.pid, 
      this.sort, 
      this.status, 
      this.title});

  LeftItemModel.fromJson(dynamic json) {
    id = json['_id'];
    pic = json['pic'];
    pid = json['pid'];
    sort = json['sort'];
    status = json['status'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['_id'] = id;
    map['pic'] = pic;
    map['pid'] = pid;
    map['sort'] = sort;
    map['status'] = status;
    map['title'] = title;
    return map;
  }

}