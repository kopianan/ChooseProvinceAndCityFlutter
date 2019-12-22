import 'package:dropdown_tutorial/api_provider.dart';
import 'package:dropdown_tutorial/models/provinces_model.dart';
import 'package:dropdown_tutorial/province_city/build_dropdown_city.dart';
import 'package:dropdown_tutorial/province_city/build_dropdown_province.dart';
import 'package:flutter/material.dart';

class DropdownFlutterExample extends StatefulWidget {
  DropdownFlutterExample({Key key}) : super(key: key);

  @override
  _DropdownFlutterExampleState createState() => _DropdownFlutterExampleState();
}

class _DropdownFlutterExampleState extends State<DropdownFlutterExample> {
  ApiProvider _apiProvider = ApiProvider();
  var futureProvince;
  @override
  void initState() {
    futureProvince = _apiProvider.getProvincesAsync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          body: Center(
        child: FutureBuilder<ProvincesModel>(
          future: futureProvince,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Container();
                break;
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.active:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Something Error"),
                  );
                } else {
                  return Column(
                    children: <Widget>[
                      BuildDropdownProvince(
                        provincesModel: snapshot.data,
                      ),
                      BuildDropdownCity()
                    ],
                  );
                }
                break;
            }
            return Container();
          },
        ),
      )),
    );
  }
}
