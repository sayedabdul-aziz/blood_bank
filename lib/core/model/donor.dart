class Donor {
  int? id;
  String? name;
  String? category;
  String? date;
  String? gender;

  Donor({this.id, this.name, this.category, this.date, this.gender});

  factory Donor.fromJson(Map<String, dynamic> json) => Donor(
        id: json['id'] as int?,
        name: json['name'] as String?,
        category: json['category'] as String?,
        date: json['date'] as String?,
        gender: json['gender'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'date': date,
        'gender': gender,
      };
}
