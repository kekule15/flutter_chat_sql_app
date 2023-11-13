import 'dart:convert';
import 'package:chat/utils/temporary_storage.dart';

class UserDB {
  static const _profile = "profile";

  // static UserData? getUser() {
  //   final data = LocalStorageManager.getString(key: _profile);
  //   if (data.isNotEmpty) {
  //     return UserData.fromJson(jsonDecode(data));
  //   }

  //   return null;
  // }

  // static Future updateUser(
  //     {required String key, required String newVal}) async {
  //   final data = getUser()?.toJson();

  //   data?.update(key, (value) => newVal);

  //   var formatedData = UserData.fromJson(data!);

  //   await addProfile(formatedData);
  // }

  // static Future addProfile(UserData model) async {
  //   await LocalStorageManager.setString(
  //       key: _profile, value: jsonEncode(model.toJson()));
  // }

  static Future deleteUser() async {
    await LocalStorageManager.eraseData(key: _profile);
  }
  
  // KEY STRINGS FOR UPDATING USERS DATA

  static const firstName = "first_name";

  static const lastName = "last_name";

  static const profileImage = "profile_image";

  static const email = "email";
}
