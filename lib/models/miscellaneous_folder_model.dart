class MiscellaneousFoldersModel {
  String? title;
  String? type;
  String? thumbnail;
  String? id;
  String? link;
  String? duration;
  List<MiscellaneousFoldersModel>? list;

  MiscellaneousFoldersModel({
    this.title,
    this.type,
    this.thumbnail,
    this.id,
    this.link,
    this.duration,
    this.list,
  });

  MiscellaneousFoldersModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
    thumbnail = json['thumbnail'];
    id = json['id'];
    link = json['link'];
    duration = json['duration'];
    if (json['list'] != null) {
      list = <MiscellaneousFoldersModel>[];
      json['list'].forEach((v) {
        list!.add(MiscellaneousFoldersModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    data['thumbnail'] = thumbnail;
    data['id'] = id;
    data['link'] = link;
    data['duration'] = duration;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}