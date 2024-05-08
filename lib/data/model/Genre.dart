class GenreModel {
  String id;
  String name;
  String image;

  GenreModel({
    required this.id,
    required this.name,
    required this.image,
  });

  static GenreModel empty() {
    return GenreModel(id: '', name: '', image: '');
  }
   Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
    };
  }

  
 factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
    );
  }
}