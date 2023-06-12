import 'package:hive_flutter/hive_flutter.dart';

part 'chat.g.dart';

@HiveType(typeId: 1)
class Chat extends HiveObject {
  @HiveField(0)
  final bool isBot;
  @HiveField(1)
  final String message;

  Chat(this.isBot, this.message);
}
