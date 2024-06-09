import 'package:flutter/material.dart';
import '../services/country_service.dart';
import '../states/country_state.dart';

class CountryStore extends ValueNotifier<CountryState> {
  final CountryService service;

  CountryStore(this.service) : super(InitialCountryState());

  Future fetchCountries() async {
    value = LoadingCountryState();

    try{
      final countries = await service.fetchCountries();
      value = SuccessCountryState(countries);
    }catch(e){
      value = ErrorCountryState(e.toString());
    }

  }
}