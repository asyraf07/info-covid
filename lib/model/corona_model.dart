import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchDataCoronaIndonesia() async {
  final String url = 'https://api.kawalcorona.com/indonesia/';
  var response = await http.get(Uri.parse(url));
  return CoronaModel.formJson(jsonDecode(response.body));
}

class CoronaModel {
  String? _name;
  String? _positif;
  String? _sembuh;
  String? _meninggal;

  CoronaModel(this._name, this._positif, this._sembuh, this._meninggal);

  factory CoronaModel.formJson(json) {
    var coronaMapIndonesia = json[0];
    return CoronaModel(
      coronaMapIndonesia['name'],
      coronaMapIndonesia['positif'],
      coronaMapIndonesia['sembuh'],
      coronaMapIndonesia['meninggal'],
    );
  }

  String get meninggal => _meninggal!;

  String get sembuh => _sembuh!;

  String get positif => _positif!;

  String get name => _name!;
}
