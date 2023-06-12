import 'package:hive_flutter/hive_flutter.dart';
import 'package:lettutor/models/chat/chat.dart';

class HiveHelper {
  final _hiveBoxPref = Hive.box("lettutor-19127502");

  void saveChatHistory(List<Chat> listChatHistory, String userID) =>
      _hiveBoxPref.put("history-chat-$userID", listChatHistory);

  List<Chat> getChatHistory(String userID) {
    print(userID);
    List<Chat>? tempChatHistory =
        _hiveBoxPref.get("history-chat-$userID")?.cast<Chat>();
    return tempChatHistory ?? [];
  }

  void clearChatHistory(String userID) =>
      _hiveBoxPref.delete("history-chat-$userID");

  void saveLanguage(String isVietnam) =>
      _hiveBoxPref.put("isVietnam", isVietnam);

  String getLanguage() {
    String? tempIsVietnam = _hiveBoxPref.get("isVietnam");
    return tempIsVietnam ?? "en";
  }
}
