import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/models/chat/chat.dart';
import 'package:lettutor/utils/hive_helper.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final OpenAI openAI;
  final List<Chat> historyLocal;
  final HiveHelper hive;
  final String userId;
  ChatBloc(this.openAI, this.historyLocal, this.hive, this.userId)
      : super(ChatInitial()) {
    on<ChatMessageEvent>((event, emit) async {
      if (state is! ChatLoading) {
        List<Chat> tempCutList = historyLocal;
        if (historyLocal.length > 12) {
          tempCutList = historyLocal.sublist(historyLocal.length - 12);
        }
        List<Map<String, String>> historyToSend = [];
        emit(ChatLoading(userMessage: event.requestMessage));
        for (Chat i in tempCutList) {
          historyToSend.add(
              {"role": i.isBot ? "assistant" : "user", "content": i.message});
        }
        historyLocal.add(Chat(false, event.requestMessage));
        historyToSend.add({"role": "user", "content": event.requestMessage});
        try {
          final request = ChatCompleteText(
              model: kChatGptTurboModel,
              maxToken: 1500,
              messages: historyToSend);
          final response = await openAI.onChatCompletion(request: request);
          if (response != null) {
            historyLocal.add(Chat(true, response.choices[0].message.content));
            hive.saveChatHistory(historyLocal, userId);
            emit(ChatMessageSuccess(botMessage: response));
          } else {
            throw Exception("Fail to get message");
          }
        } catch (err) {
          emit(ChatFailure(errorMsg: err.toString()));
        }
      }
    });

    on<ChatDeleteEvent>((event, emit) async {
      historyLocal.clear();
      hive.clearChatHistory(userId);
      emit(ChatDelete());
      emit(ChatInitial());
    });
  }
}
