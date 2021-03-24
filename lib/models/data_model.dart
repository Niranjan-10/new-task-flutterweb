class DataModel {
  String date;
  String explanation;
  String mediaType;
  String serviceVersion;
  String title;
  String url;

  DataModel(
      {this.date,
      this.explanation,
      this.mediaType,
      this.serviceVersion,
      this.title,
      this.url});

  DataModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    explanation = json['explanation'];
    mediaType = json['media_type'];
    serviceVersion = json['service_version'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['explanation'] = this.explanation;
    data['media_type'] = this.mediaType;
    data['service_version'] = this.serviceVersion;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }

}