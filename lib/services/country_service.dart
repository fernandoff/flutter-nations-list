import 'package:uno/uno.dart';
import '../models/country/country_model.dart';

class CountryService{
  final Uno uno;

  CountryService(this.uno);

  Future<List<CountryModel>> fetchCountries() async{
    final response = await uno.get('https://datausa.io/api/data?drilldowns=Nation&measures=Population');
    final list = response.data['data'] as List;
    return list.map((e) => CountryModel.fromMap(e)).toList();
  }
}

