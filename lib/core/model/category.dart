class Category {
  int? aPLus;
  int? aMinus;
  int? abPLus;
  int? abMinus;
  int? bPLus;
  int? bMinus;
  int? oPLus;
  int? oMinus;

  Category({
    this.aPLus,
    this.aMinus,
    this.abPLus,
    this.abMinus,
    this.bPLus,
    this.bMinus,
    this.oPLus,
    this.oMinus,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        aPLus: json['A+'] as int?,
        aMinus: json['A-'] as int?,
        abPLus: json['AB+'] as int?,
        abMinus: json['AB-'] as int?,
        bPLus: json['B+'] as int?,
        bMinus: json['B-'] as int?,
        oPLus: json['O+'] as int?,
        oMinus: json['O-'] as int?,
      );
}
