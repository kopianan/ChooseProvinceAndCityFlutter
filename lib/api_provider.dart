import 'package:dio/dio.dart';
import 'package:dropdown_tutorial/models/cities_model.dart';
import 'package:dropdown_tutorial/models/provinces_model.dart';

class ApiProvider {
  Dio dio = Dio();
  String _webUrl = "https://api.rajaongkir.com";
  Map<String, dynamic> rajaOngkirHeader = {
    "key": "d3378ccdaa201c0b0bffbd673aab43c2"
  };

  Future<ProvincesModel> getProvincesAsync() async {
    Response response;
    try {
      response = await dio.get(_webUrl + "/starter/province",
          options: Options(headers: rajaOngkirHeader));

      if (response.statusCode == 200) {
        final provinceModel = ProvincesModel.fromJson(response.data);

        print(provinceModel.rajaongkir.results.first.toJson());
        return provinceModel;
      } else
        return null;
    } on DioError catch (e) {
      return null;
    }
  }
  Future<CitiesModel> getCitiesByProvinceId(int id) async {
    Response response;
    try {
      response = await dio.get(_webUrl + "/starter/city",
          options: Options(headers: rajaOngkirHeader),
          queryParameters: {"province": id}
          );

      if (response.statusCode == 200) {
        final citiesModel = CitiesModel.fromJson(response.data);

        print(citiesModel.rajaongkir.results.first.toJson());
        return citiesModel;
      } else
        return null;
    } on DioError catch (e) {
      return null;
    }
  }
}
