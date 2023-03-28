import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:lettutor/common_widget/dialog_back_to_login.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPassColumn extends StatefulWidget {
  const ForgotPassColumn({Key? key}) : super(key: key);

  @override
  State<ForgotPassColumn> createState() => _ForgotPassColumnState();
}

class _ForgotPassColumnState extends State<ForgotPassColumn> {
  late ForgotPasswordBloc forgotPasswordBloc;
  late TextEditingController emailEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailEditingController = TextEditingController();
    forgotPasswordBloc = BlocProvider.of<ForgotPasswordBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      bloc: forgotPasswordBloc,
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          showDialog(
              context: context,
              builder: (context) => const DialogBackToLogin(
                  title: "Reset password successfully",
                  content: "Check your email inbox for a message from us and"
                      " click on the reset password link to reset your account's password"));
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email",
                    style: GoogleFonts.openSans(
                        textStyle: FontConst.regular.copyWith(fontSize: 14))),
                const SizedBox(
                  height: StyleConst.kDefaultPadding / 2,
                ),
                TextField(
                  controller: emailEditingController,
                  style: const TextStyle(fontSize: 14),
                  enabled: state is ForgotPasswordLoading ? false : true,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ColorConst.hintTextColor),
                        borderRadius:
                            BorderRadius.circular(StyleConst.defaultRadius)),
                    hintText: "email@example.com",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: StyleConst.kDefaultPadding,
            ),
            if (state is ForgotPasswordError)
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
                onPressed: state is ForgotPasswordLoading
                    ? null
                    : () {
                        forgotPasswordBloc.add(
                            ForgotPasswordEvent(emailEditingController.text));
                      },
                child: state is ForgotPasswordLoading
                    ? const SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                    : Text(
                        AppLocalizations.of(context)!.sendResetLink,
                        style: GoogleFonts.roboto(
                            textStyle:
                                FontConst.regular.copyWith(fontSize: 14)),
                      ))
          ],
        );
      },
    );
  }
}
