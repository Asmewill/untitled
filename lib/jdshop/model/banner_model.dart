/// result : [{"_id":"59f6ef443ce1fb0fb02c7a43","title":"笔记本电脑","status":"1","pic":"public\\upload\\UObZahqPYzFvx_C9CQjU8KiX.png","url":"12"},{"_id":"5a012efb93ec4d199c18d1b4","title":"第二个轮播图","status":"1","pic":"public\\upload\\f3OtH11ZaPX5AA4Ov95Q7DEM.png"},{"_id":"5a012f2433574208841e0820","title":"第三个轮播图","status":"1","pic":"public\\upload\\s5ujmYBQVRcLuvBHvWFMJHzS.jpg"},{"_id":"5a688a0ca6dcba0ff4861a3d","title":"教程","status":"1","pic":"public\\upload\\Zh8EP9HOasV28ynDSp8TaGwd.png"}]

class BannerModel {
  List<BannerItemModel> result=[];

  BannerModel({ required
      this.result});

  BannerModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(BannerItemModel.fromJson(v));
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

/// _id : "59f6ef443ce1fb0fb02c7a43"
/// title : "笔记本电脑"
/// status : "1"
/// pic : "public\\upload\\UObZahqPYzFvx_C9CQjU8KiX.png"
/// url : "12"

class BannerItemModel {
  String? id;
  String? title;
  String? status;
  String pic="";
  String? url;

  BannerItemModel({
      this.id, 
      this.title, 
      this.status, 
      this.pic="",
      this.url});

  BannerItemModel.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['status'] = status;
    map['pic'] = pic;
    map['url'] = url;
    return map;
  }

}