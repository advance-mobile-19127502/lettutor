import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/settings_bloc/settings_bloc.dart';

class ModalSelectLanguage extends StatelessWidget {
  const ModalSelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Select Speech Language",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              thickness: 2,
            ),
            InkWell(
              onTap: () => onPressSpeech("vi", context),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/vietnam_flag.png",
                      width: 35,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      "VietNamese (Viet Nam)",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    if (BlocProvider.of<SettingsBloc>(context)
                            .languageSelected ==
                        "vn")
                      Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                      ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            InkWell(
              onTap: () => onPressSpeech("en", context),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/en_flag.png",
                      width: 35,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      "English (United States)",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    if (BlocProvider.of<SettingsBloc>(context)
                            .languageSelected ==
                        "en")
                      Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressSpeech(String value, BuildContext context) {
    BlocProvider.of<SettingsBloc>(context).add(ChangeSettingsEvent(value));
    Navigator.pop(context);
  }
}
