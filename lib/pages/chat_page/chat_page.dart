import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:lettutor/bloc/chat_bloc/chat_bloc.dart';
import 'package:lettutor/bloc/user_bloc/user_bloc.dart';
import 'package:lettutor/pages/chat_page/chat_page_official.dart';
import 'package:lettutor/utils/hive_helper.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late HiveHelper hiveHelper;
  late OpenAI openAI;

  @override
  void initState() {
    super.initState();
    hiveHelper = HiveHelper();
    openAI = OpenAI.instance.build(
        token: FlutterConfig.get("API_KEY"),
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 50)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        if (userState is UserLoading) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("ChatGPT"),
              ),
              body: const Center(child: CircularProgressIndicator()));
        }
        if (userState is UserError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("ChatGPT"),
            ),
            body: const Center(
              child: Text("Failed to get information, please try again"),
            ),
          );
        }
        return BlocProvider(
          create: (context) => ChatBloc(
              openAI,
              hiveHelper.getChatHistory(
                  BlocProvider.of<UserBloc>(context).accountInfo!.user!.id!),
              hiveHelper,
              BlocProvider.of<UserBloc>(context).accountInfo!.user!.id!),
          child: const ChatPageOfficial(),
        );
      },
    );
  }
}
