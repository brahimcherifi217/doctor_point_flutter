import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:doctor_point/model/login_response_model.dart';
import 'package:flutter/material.dart';

class SharedServices {
  static Future<bool> isLogedIn() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist("login_detail");
    return isKeyExist;
  }

  static Future<LoginResponseModel?> userDetail() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist("login_detail");
    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData("login_detail");
      return loginResponseModel(cacheData.syncData);
    }
    return null;
  }

  static Future<void> setLoginDetail(LoginResponseModel model) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
        key: "login_detail", syncData: jsonEncode(model.toJson()));
    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logOut(BuildContext context) async {
    await APICacheManager().deleteCache("login_detail");
  }
}
