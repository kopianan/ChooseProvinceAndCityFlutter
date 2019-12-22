import 'package:dropdown_tutorial/models/cities_model.dart';
import 'package:dropdown_tutorial/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api_provider.dart';

class BuildDropdownCity extends StatefulWidget {
  BuildDropdownCity({Key key, this.citiesModel}) : super(key: key);

  final CitiesModel citiesModel;

  @override
  _BuildDropdownCityState createState() => _BuildDropdownCityState();
}

class _BuildDropdownCityState extends State<BuildDropdownCity> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (_, dataProvider, __) => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 60,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: DropdownButton(
          underline: SizedBox(),
          items: (dataProvider.getCitiesModel == null)
              ? null
              : dataProvider.getCitiesModel.rajaongkir.results
                  .map((city) => DropdownMenuItem(
                        child: Text(
                          (city.type == "Kota")
                            ? city.cityName
                            : city.type + " " + city.cityName),
                        value: city,
                      ))
                  .toList(),
          isDense: false,
          elevation: 3,
          isExpanded: true,
          hint: Text("Choose your city"),
          onChanged: (Results val) {
            dataProvider.setTempDataCity(val);
          },
          value: dataProvider.getTempDataCity,
        ),
      ),
    );
  }
}
