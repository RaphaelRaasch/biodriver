import 'dart:convert';
import 'package:biodriver/app/shared/consts.dart';
import 'package:biodriver/app/shared/model/mtr_model.dart';
import 'package:http/http.dart' as http;

import '../../shared/model/mtr_model.dart';
import '../../shared/model/mtr_model.dart';
import '../../shared/model/mtr_model.dart';

class MtrRepository {
  Future<List<MtrItemModel>> getAllMtrs() async {
    try {
      List<MtrItemModel> listMtr = List();
      final response = await http.get(API_MTR, headers: {
        "Authorization": "token 9b2bf09c2037baeea3e1fb69241ef186098b1a79"
      });
      if (response.statusCode == 200) {
        var decodeJson = json.decode(response.body) as List;
        decodeJson.forEach((item) => listMtr.add(MtrItemModel.fromJson(item)));
        return listMtr;
      } else {
        print('erro ao carregar lista' + response.statusCode.toString());
      }
    } catch (error, stacktrace) {
      print('erro ao carregar lista' + stacktrace.toString());
      return null;
    }
  }
}
