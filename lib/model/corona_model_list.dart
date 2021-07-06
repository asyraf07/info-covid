import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:info_covid/model/corona_model.dart';

Future fetchDataCoronaProvinsi() async {
  final String url = 'https://api.kawalcorona.com/indonesia/provinsi';
  var response = await http.get(Uri.parse(url));
  return CoronaModelList.provinsiFromJson(jsonDecode(response.body));
}

class CoronaModelList {
  List<CoronaModel>? _covid;

  CoronaModelList(this._covid);

  factory CoronaModelList.provinsiFromJson(json) {
    List<CoronaModel> list = [];

    json.forEach((value) {
      var attributes = value['attributes'];
      list.add(
        CoronaModel(
          attributes['Provinsi'],
          attributes['Kasus_Posi'].toString(),
          attributes['Kasus_Semb'].toString(),
          attributes['Kasus_Meni'].toString(),
        ),
      );
    });
    list.sort((a, b) => a.name.compareTo(b.name));
    return CoronaModelList(list);
  }

  List<CoronaModel> get covid => _covid!;

  int get length => _covid!.length;
}
