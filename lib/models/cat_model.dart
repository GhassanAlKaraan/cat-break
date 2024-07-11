class Cat {
  String? id;
  String? url;
  int? width;
  int? height;

  Cat({this.id, this.url, this.width, this.height});

  Cat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

// Example JSON when calling: GET https://api.thecatapi.com/v1/images/0XYvRd7oD

// {
//     "id": "0XYvRd7oD",
//     "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
//     "width": 1204,
//     "height": 1445
// }