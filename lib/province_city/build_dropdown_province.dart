import 'package:dropdown_tutorial/api_provider.dart';
import 'package:dropdown_tutorial/models/provinces_model.dart';
import 'package:dropdown_tutorial/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildDropdownProvince extends StatefulWidget {
  const BuildDropdownProvince({Key key, @required this.provincesModel})
      : super(key: key);

  final ProvincesModel provincesModel;

  @override
  _BuildDropdownProvinceState createState() => _BuildDropdownProvinceState();
}

class _BuildDropdownProvinceState extends State<BuildDropdownProvince> {
  ApiProvider _apiProvider = ApiProvider();
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
          items: widget.provincesModel.rajaongkir.results
              .map((province) => DropdownMenuItem(
                    child: Text(province.province),
                    value: province,
                  ))
              .toList(),
          isDense: false,
          elevation: 3,
          isExpanded: true,
          hint: Text("Choose your province"),
          onChanged: (Results val) {
            dataProvider.setTempDataprovince(val);

          //get data city with id that choosen
            _apiProvider
                .getCitiesByProvinceId(int.parse(val.provinceId))
                .then((onValue) {
                  dataProvider.setTempDataCity(null); 
                  dataProvider.setCitiesModel(onValue); 
            });
          },
          value: dataProvider.getTempDataProvince,
        ),
      ),
    );
  }
}
