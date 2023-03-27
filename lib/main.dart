import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/auth_bloc/auth_bloc.dart';

import 'package:lettutor/bloc/register_bloc/register_bloc.dart';
import 'package:lettutor/constants/url_const.dart';
import 'package:lettutor/data/list_tutor.dart';
import 'package:lettutor/providers/list_tutor_provider.dart';
import 'package:lettutor/providers/locale_provider.dart';
import 'package:lettutor/repositories/auth_repository.dart';
import 'package:lettutor/route_generator.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  timeago.setLocaleMessages("vi", timeago.ViMessages());
  timeago.setLocaleMessages("en", timeago.EnMessages());

  runApp(ChangeNotifierProvider(
      create: (context) => LocaleProvider(), child: const MyApp()));
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
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ListTutorProvider()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    AuthBloc(AuthRepository("${UrlConst.baseUrl}/auth")))
          ],
          child: MaterialApp(
            locale: Provider.of<LocaleProvider>(context).getLocale,
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            initialRoute: RouteGenerator.splashRoute,
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        ),
      ),
    );
  }
}
