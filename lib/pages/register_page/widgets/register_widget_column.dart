import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/register_bloc/register_bloc.dart';
import 'package:lettutor/common_widget/dialog_back_to_login.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/pages/login_page/login_page.dart';
import 'package:lettutor/pages/register_page/widgets/register_form_field.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/route_generator.dart';

class RegisterWidgetColumn extends StatefulWidget {
  const RegisterWidgetColumn({Key? key, required this.formSignUpKey})
      : super(key: key);
  final GlobalKey<FormState> formSignUpKey;

  @override
  State<RegisterWidgetColumn> createState() => _RegisterWidgetColumnState();
}

class _RegisterWidgetColumnState extends State<RegisterWidgetColumn> {
  bool isValid = false;
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  late RegisterBloc authBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      bloc: authBloc,
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showDialog(
              context: context,
              builder: (context) => const DialogBackToLogin(
                  title: "Register successfully",
                  content: "Check your email inbox for a message from us and"
                      " click on the activation link to activate your account"));
        }
      },
      builder: (context, state) {
        return Form(
          key: widget.formSignUpKey,
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {
            setState(() {
              isValid = widget.formSignUpKey.currentState!.validate();
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterFormField(
                emailController: emailEditingController,
                passwordController: passwordEditingController,
              ),
              if (state is RegisterFailure)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      state.message ?? "Error",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(color: Colors.red)),
                    ),
                  ),
                ),
              ElevatedButton(
                  onPressed: !isValid || state is RegisterLoading
                      ? null
                      : () {
                          authBloc.add(RegisterEvent(
                              emailEditingController.text,
                              passwordEditingController.text));
                        },
                  child: Center(
                    child: state is RegisterLoading
                        ? const SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            AppLocalizations.of(context)!.signUp.toUpperCase(),
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
