import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor/bloc/user_bloc/user_bloc.dart';

class EditAvaProfile extends StatefulWidget {
  const EditAvaProfile({Key? key}) : super(key: key);

  @override
  State<EditAvaProfile> createState() => _EditAvaProfileState();
}

class _EditAvaProfileState extends State<EditAvaProfile> {
  late UserBloc userBloc;
  late ImagePicker imagePicker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userBloc = BlocProvider.of<UserBloc>(context);
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UploadingAvatarFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Upload failed, please try again",
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(40),
                    child: Image.network(
                      userBloc.accountInfo?.user?.avatar ??
                          "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ",
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Image.network(
                            "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ");
                      },
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () async {
                        await uploadAvatar();
                      },
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ))
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> uploadAvatar() async {
    final imagePickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePickedFile != null) {
      userBloc.add(UploadAvatarEvent(imagePickedFile.path));
    }
  }
}
