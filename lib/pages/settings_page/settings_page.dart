import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/settings_bloc/settings_bloc.dart';
import 'package:lettutor/pages/settings_page/widgets/modal_select_language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const ModalSelectLanguage();
                      });
                },
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                            flex: 2,
                            child: Text(
                              "Language",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            )),
                        BlocBuilder<SettingsBloc, SettingsState>(
                          bloc: BlocProvider.of<SettingsBloc>(context),
                          builder: (context, state) {
                            return Expanded(
                                child: RichText(
                              textAlign: TextAlign.right,
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                  children: [
                                    TextSpan(
                                        text: BlocProvider.of<SettingsBloc>(
                                                        context)
                                                    .languageSelected ==
                                                "vi"
                                            ? "Vietnam\n"
                                            : "English\n"),
                                    TextSpan(
                                        text: BlocProvider.of<SettingsBloc>(
                                                        context)
                                                    .languageSelected ==
                                                "vi"
                                            ? "(Vietnamese)"
                                            : "(United States)")
                                  ]),
                            ));
                          },
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
