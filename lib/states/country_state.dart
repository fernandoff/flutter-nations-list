import '../models/country/country_model.dart';

abstract class CountryState{}

class InitialCountryState extends CountryState{}

class SuccessCountryState extends CountryState{

  final List<CountryModel> countries;

  SuccessCountryState(this.countries);
}

class LoadingCountryState extends CountryState{}

class ErrorCountryState extends CountryState{

  final String message;

  ErrorCountryState(this.message);
}