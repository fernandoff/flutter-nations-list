import 'country_annotations.dart';

class CountryModel{

  final String id;
  final String nation;
  final int year;
  final int population;
  final String slug;
  //final CountryAnnotationsModel? annotations;

//<editor-fold desc="Data Methods">
  const CountryModel({
    required this.id,
    required this.nation,
    required this.year,
    required this.population,
    required this.slug,
    //this.annotations,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountryModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          nation == other.nation &&
          year == other.year &&
          population == other.population &&
          slug == other.slug
          //annotations == other.annotations
      );

  @override
  int get hashCode =>
      id.hashCode ^
      nation.hashCode ^
      year.hashCode ^
      population.hashCode ^
      slug.hashCode;
      //annotations.hashCode;

  @override
  String toString() {
    return 'CountryModel{ id: $id, nation: $nation, year: $year, population: $population, slug: $slug}';
  }

  CountryModel copyWith({
    String? id,
    String? nation,
    int? year,
    int? population,
    String? slug,
    CountryAnnotationsModel? annotations,
  }) {
    return CountryModel(
      id: id ?? this.id,
      nation: nation ?? this.nation,
      year: year ?? this.year,
      population: population ?? this.population,
      slug: slug ?? this.slug,
      //annotations: annotations ?? this.annotations,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nation': nation,
      'year': year,
      'population': population,
      'slug': slug,
      //'annotations': annotations,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['ID Nation'] as String,
      nation: map['Nation'] as String,
      year: map['ID Year'] as int,
      population: map['Population'] as int,
      slug: map['Slug Nation'] as String,
      //annotations: map['annotations']?? "" as CountryAnnotationsModel,
    );
  }

//</editor-fold>
}