import 'dart:convert';

import 'package:Ecommerce/constants.dart';
import 'package:Ecommerce/core/services/shared_preferences_singleton.dart';
import 'package:Ecommerce/features/auth/data/models/user_model.dart';
import 'package:Ecommerce/features/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
