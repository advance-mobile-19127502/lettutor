import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lettutor/bloc/auth_bloc/auth_bloc.dart';

import 'package:lettutor/bloc/register_bloc/register_bloc.dart';
import 'package:lettutor/bloc/settings_bloc/settings_bloc.dart';
import 'package:lettutor/constants/url_const.dart';
import 'package:lettutor/models/chat/chat.dart';
import 'package:lettutor/repositories/auth_repository.dart';
import 'package:lettutor/route_generator.dart';
import 'package:lettutor/utils/hive_helper.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  timeago.setLocaleMessages("vi", timeago.ViMessages());
  timeago.setLocaleMessages("en", timeago.EnMessages());
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Hive.initFlutter();
  Hive.registerAdapter<Chat>(ChatAdapter());
  await Hive.openBox("lettutor-19127502");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AuthBloc(AuthRepository("${UrlConst.baseUrl}/auth"))),
          BlocProvider(
              create: (context) =>
                  SettingsBloc(HiveHelper(), HiveHelper().getLanguage()))
        ],
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              locale: Locale(
                  BlocProvider.of<SettingsBloc>(context).languageSelected),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              initialRoute: RouteGenerator.splashRoute,
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
