import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/auth_bloc/auth_bloc.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/pages/login_page/widgets/login_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/route_generator.dart';

class LoginWidgetColumn extends StatefulWidget {
  const LoginWidgetColumn({Key? key, required this.formLoginKey})
      : super(key: key);
  final GlobalKey<FormState> formLoginKey;

  @override
  State<LoginWidgetColumn> createState() => _LoginWidgetColumnState();
}

class _LoginWidgetColumnState extends State<LoginWidgetColumn> {
  bool isValid = false;
  late AuthBloc authBloc;
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc = BlocProvider.of(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.of(context).pushNamed(RouteGenerator.mainPageRoute);
        }
      },
      builder: (context, state) {
        return Form(
          key: widget.formLoginKey,
          onChanged: () {
            setState(() {
              isValid = widget.formLoginKey.currentState!.validate();
            });
          },
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginFormField(
                emailController: emailEditingController,
                passwordController: passwordEditingController,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RouteGenerator.forgotPassRoute);
                  },
                  child: Text(AppLocalizations.of(context)!.forgotPassword)),
              if (state is AuthError)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      state.message,
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(color: Colors.red)),
                    ),
                  ),
                ),
              ElevatedButton(
                  onPressed: !isValid || state is AuthLoading
                      ? null
                      : () {
                          authBloc.add(LoginEvent(emailEditingController.text,
                              passwordEditingController.text));
                        },
                  child: Center(
                    child: state is AuthLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            AppLocalizations.of(context)!.login.toUpperCase(),
                            style: GoogleFonts.roboto(
                                textStyle:
                                    FontConst.semiBold.copyWith(fontSize: 20)),
                          ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
