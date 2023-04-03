class RepoModel {
  int? totalCount;
  bool? incompleteResults;
  List<Items>? items;

  RepoModel({this.totalCount, this.incompleteResults, this.items});

  RepoModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['incomplete_results'] = this.incompleteResults;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  bool? private;
  Owner? owner;
  String? description;
  int? stargazersCount;
  int? watchersCount;

  Items(
      {this.id,
        this.nodeId,
        this.name,
        this.fullName,
        this.private,
        this.owner,
        this.description,
        this.stargazersCount,
        this.watchersCount});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    description = json['description'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['private'] = this.private;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['description'] = this.description;
    data['stargazers_count'] = this.stargazersCount;
    data['watchers_count'] = this.watchersCount;
    return data;
  }
}

class Owner {
  String? login;
  String? avatarUrl;

  Owner({this.login, this.avatarUrl});

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}
