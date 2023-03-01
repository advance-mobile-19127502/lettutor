import 'package:flutter/material.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/providers/locale_provider.dart';
import 'package:provider/provider.dart';

class ChangeLocaleWidget extends StatelessWidget {
  const ChangeLocaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(builder: (context, localeProvider, child) =>
        DropdownButton(
          value: localeProvider.getLocale,
          onChanged: (Locale? newLocale) {
            if (newLocale is Locale) {
              localeProvider.setLocale(newLocale);
            }
          },
          items: [
            DropdownMenuItem<Locale>(
              value: const Locale("vi"),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage(
                        "assets/images/vietnam_flag.png"),),
                  SizedBox(width: StyleConst.kDefaultPadding / 3,),
                  Text("VN"),
                ],
              ),
            ),
            DropdownMenuItem<Locale>(
              value: const Locale("en"),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage("assets/images/en_flag.png"),),
                  SizedBox(width: StyleConst.kDefaultPadding / 3,),
                  Text("EN"),
                ],
              ),
            )
          ],
        )
    );
  }
}
