import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  final _hiveBoxPref = Hive.box("lettutor-19127502");

  void saveLanguage(String isVietnam) =>
      _hiveBoxPref.put("isVietnam", isVietnam);

  String getLanguage() {
    String? tempIsVietnam = _hiveBoxPref.get("isVietnam");
    return tempIsVietnam ?? "en";
  }
}
