// Example
// Step 1: Class A extends BasePageList
// Step 2: A.fromJson(Map<String, dynamic> json) : super.fromJson(json){}

abstract class BasePageList {
  BasePageList({this.page, this.limit, this.pages, this.total, this.unseen});

  BasePageList.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    pages = json['pages'];
    total = json['total'];
    unseen = json['unseen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['pages'] = this.pages;
    data['total'] = this.total;
    data['unseen'] = this.unseen;
    return data;
  }

  int? page;
  int? limit;
  int? pages;
  int? total;
  int? unseen;
}
