import 'package:dropdown_tutorial/models/cities_model.dart' as city;
import 'package:dropdown_tutorial/models/provinces_model.dart' as province;
import 'package:flutter/cupertino.dart';

class DataProvider extends ChangeNotifier {
  province.Results _tempDataProvince;
  city.CitiesModel _citiesModel;
  city.Results _tempDataCity;

  setTempDataprovince(province.Results results) {
    this._tempDataProvince = results;
    notifyListeners();
  }

  province.Results get getTempDataProvince => this._tempDataProvince;


  setTempDataCity(city.Results results) {
    this._tempDataCity = results;
    notifyListeners();
  }

  city.Results get getTempDataCity => this._tempDataCity;


    setCitiesModel(city.CitiesModel citiesModel) {
    this._citiesModel = citiesModel;
    notifyListeners();
  }

  city.CitiesModel get getCitiesModel => this._citiesModel;
}
