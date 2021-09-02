/// result : [{"_id":"59f1e4919bfd8f3bd030eed6","title":"手机/电脑","status":"1","pic":"public\\upload\\RQXtJTh1WbzxpSbLF-vjDYTo.png","pid":"59f1e1ada1da8b15d42234e9","sort":"100"},{"_id":"59f1e49a9bfd8f3bd030eed7","title":"轻薄本","status":"1","pic":"public\\upload\\HYWKHxrKgE9O6zKajRTmb50B.png","pid":"59f1e1ada1da8b15d42234e9","sort":"100"},{"_id":"59f1e4e69bfd8f3bd030eed8","title":"游戏台式机","status":"1","pic":"public\\upload\\DjXIpErQNsPo4qj_8c4GVmRg.jpg","pid":"59f1e1ada1da8b15d42234e9","sort":"100"},{"_id":"5a050550010e71123466145c","title":"机械硬盘","status":"1","pic":"public\\upload\\kj4oSfSHfo_RgM0byzapGnfN.jpg","pid":"59f1e1ada1da8b15d42234e9","sort":"0"},{"_id":"5a050569010e71123466145d","title":"一体机","status":"1","pic":"public\\upload\\HPi-GL8lrKI2hJKI6DB05_6M.jpg","pid":"59f1e1ada1da8b15d42234e9","sort":"0"},{"_id":"5a05057e010e71123466145e","title":"平板电脑","status":"1","pic":"public\\upload\\yF2i949_8_3HtSS6_30yQdfj.jpg","pid":"59f1e1ada1da8b15d42234e9","sort":"0"},{"_id":"5a050587010e71123466145f","title":"显示器","status":"1","pic":"public\\upload\\3sAhooWbdKkKddq5yE3QFByC.jpg","pid":"59f1e1ada1da8b15d42234e9","sort":"0"},{"_id":"5a050597010e711234661460","title":"显卡","status":"1","pic":"public\\upload\\FidYRXGz1iotfhhBRopAfJr8.jpg","pid":"59f1e1ada1da8b15d42234e9","sort":"0"},{"_id":"5a0505ae010e711234661461","title":"主板","status":"1","pic":"public\\upload\\VLUbJuO1c7Bo-JVO4iytouXU.jpg","pid":"59f1e1ada1da8b15d42234e9","sort":"0"},{"_id":"5a0505c7010e711234661463","title":"散热器","status":"1","pic":"public\\upload\\7ozKpYjSVtWfYjqR4er1TeXm.jpg","pid":"59f1e1ada1da8b15d42234e9","sort":"0"},{"_id":"5a0505e7010e711234661464","title":"CPU","status":"1","pic":"public\\upload\\ITLwdMsoj8RDHKbxISrSagUe.jpg","pid":"59f1e1ada1da8b15d42234e9","sort":"0"}]

class RightModel {
  List<RightItemModel> result=[];

  RightModel({required
      this.result});

  RightModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(RightItemModel.fromJson(v));
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

/// _id : "59f1e4919bfd8f3bd030eed6"
/// title : "手机/电脑"
/// status : "1"
/// pic : "public\\upload\\RQXtJTh1WbzxpSbLF-vjDYTo.png"
/// pid : "59f1e1ada1da8b15d42234e9"
/// sort : "100"

class RightItemModel {
  String? id;
  String? title;
  String? status;
  String pic="";
  String? pid;
  String? sort;

  RightItemModel({
      this.id, 
      this.title, 
      this.status, 
      this.pic="",
      this.pid, 
      this.sort});

  RightItemModel.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    pid = json['pid'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['status'] = status;
    map['pic'] = pic;
    map['pid'] = pid;
    map['sort'] = sort;
    return map;
  }

}