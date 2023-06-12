import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lettutor/bloc/chat_bloc/chat_bloc.dart';
import 'package:lettutor/pages/chat_page/widgets/chat_row.dart';
import 'package:lettutor/pages/chat_page/widgets/send_message_widget.dart';

class ChatPageOfficial extends StatefulWidget {
  const ChatPageOfficial({Key? key}) : super(key: key);

  @override
  State<ChatPageOfficial> createState() => _ChatPageOfficialState();
}

class _ChatPageOfficialState extends State<ChatPageOfficial> {
  final List<ChatRow> _chatRow = [];
  late ChatBloc _chatBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chatBloc = BlocProvider.of(context);
    initData();
  }

  void initData() {
    List.generate(_chatBloc.historyLocal.length, (index) {
      _chatRow.insert(
          0,
          ChatRow(
              isBot: _chatBloc.historyLocal[index].isBot,
              message: _chatBloc.historyLocal[index].message,
              indexChat: 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, chatState) {
        if (chatState is ChatMessageSuccess) {
          _chatRow.insert(
              0,
              ChatRow(
                isBot: true,
                message: chatState.botMessage.choices[0].message.content,
                indexChat: _chatRow.length,
              ));
        } else if (chatState is ChatLoading) {
          _chatRow.insert(
              0,
              ChatRow(
                isBot: false,
                message: chatState.userMessage,
                indexChat: _chatRow.length,
              ));
        } else if (chatState is ChatFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(chatState.errorMsg),
            backgroundColor: Colors.red,
            elevation: 0,
          ));
        } else if (chatState is ChatDelete) {
          _chatRow.clear();
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("ChatGPT"),
              actions: [
                IconButton(
                    onPressed: () {
                      BlocProvider.of<ChatBloc>(context)
                          .add(const ChatDeleteEvent());
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
            body: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  reverse: true,
                  itemCount: _chatRow.length,
                  itemBuilder: (context, index) {
                    return _chatRow[index];
                  },
                )),

                state is ChatLoading
                    ? const SpinKitThreeBounce(
                        size: 25,
                        color: Colors.blueAccent,
                      )
                    : const SizedBox(),

                const Divider(
                  thickness: 2,
                ),

                //Send message
                const SendMessageWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
