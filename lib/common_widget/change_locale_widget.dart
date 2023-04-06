import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/settings_bloc/settings_bloc.dart';
import 'package:lettutor/constants/style_const.dart';

class ChangeLocaleWidget extends StatelessWidget {
  const ChangeLocaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return DropdownButton(
          value: BlocProvider.of<SettingsBloc>(context).languageSelected,
          onChanged: (String? newLocale) {
            if (newLocale != null) {
              BlocProvider.of<SettingsBloc>(context)
                  .add(ChangeSettingsEvent(newLocale));
            }
          },
          items: [
            DropdownMenuItem<String>(
              value: "vi",
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage:
                        AssetImage("assets/images/vietnam_flag.png"),
                  ),
                  SizedBox(
                    width: StyleConst.kDefaultPadding / 3,
                  ),
                  Text("VN"),
                ],
              ),
            ),
            DropdownMenuItem<String>(
              value: "en",
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage("assets/images/en_flag.png"),
                  ),
                  SizedBox(
                    width: StyleConst.kDefaultPadding / 3,
                  ),
                  Text("EN"),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
