import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lettutor/bloc/chat_bloc/chat_bloc.dart';
import 'package:lettutor/constants/style_const.dart';

class SendMessageWidget extends StatefulWidget {
  const SendMessageWidget({Key? key}) : super(key: key);

  @override
  State<SendMessageWidget> createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  late ChatBloc _chatBloc;
  final TextEditingController _sendMessageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chatBloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _chatBloc,
        builder: (context, state) => Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  const SizedBox(
                    width: StyleConst.kDefaultPadding,
                  ),
                  Expanded(
                      child: TextField(
                    controller: _sendMessageController,
                    onSubmitted: (value) {
                      _sendMessage();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Aa",
                    ),
                  )),
                  state is ChatLoading
                      ? const SpinKitThreeBounce(
                          size: 25,
                          color: Colors.blueAccent,
                        )
                      : IconButton(
                          onPressed: _sendMessage, icon: const Icon(Icons.send))
                ],
              ),
            ));
  }

  void _sendMessage() async {
    if (_sendMessageController.text.isEmpty) return;
    String tempMessage = _sendMessageController.text;
    _sendMessageController.clear();
    _chatBloc.add(ChatMessageEvent(tempMessage));
  }
}
