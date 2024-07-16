class Cat {
  String? id;
  String? url;

  Cat({this.id, this.url});

  Cat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    return data;
  }
}

// Example JSON when calling: GET https://api.thecatapi.com/v1/images/0XYvRd7oD

// {
//     "id": "0XYvRd7oD",
//     "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
// }