import 'package:flutter_test/flutter_test.dart';
import 'package:reactivity_test/services/country_service.dart';
import 'package:uno/uno.dart';

void main(){

  final countryService = CountryService(Uno());

  test('should get al country', () async {
    final countries = await countryService.fetchCountries();
    //print(countries.runtimeType);
    //print(countries);
    expect(countries[0].population, 331097593);
  });

}

