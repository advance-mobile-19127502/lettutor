import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/models/from_api/account_info.dart';
import 'package:lettutor/repositories/user_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository repository;
  AccountInfo? accountInfo;

  UserBloc(this.repository) : super(UserInitial()) {
    on<FetchUserInfo>((event, emit) async {
      emit(UserLoading());
      try {
        accountInfo = await repository.getAccountInfo();
        emit(UserSuccess(accountInfo!));
      } catch (error) {
        emit(UserError());
      }
    });

    on<UploadAvatarEvent>((event, emit) async {
      try {
        emit(UserInitial());
        AccountInfo newAccountInfo =
            await repository.uploadAvatar(event.imagePath);
        accountInfo = newAccountInfo;
        emit(UserSuccess(newAccountInfo));
      } catch (error) {
        emit(UploadingAvatarFailed());
      }
    });

    on<UpdateInfoEvent>((event, emit) async {
      try {
        emit(UserInitial());
        String tempName =
            event.name.isEmpty ? accountInfo!.user!.name! : event.name;
        String tempCountry =
            event.country.isEmpty ? accountInfo!.user!.country! : event.country;
        String tempBirthday = event.birthDay.isEmpty
            ? accountInfo!.user!.birthday!
            : event.birthDay;

        AccountInfo newAccountInfo =
            await repository.updateInfo(tempName, tempCountry, tempBirthday);
        accountInfo = newAccountInfo;
        emit(UserSuccess(newAccountInfo));
      } catch (error) {
        emit(UpdateInfoFailed());
      }
    });
  }
}
