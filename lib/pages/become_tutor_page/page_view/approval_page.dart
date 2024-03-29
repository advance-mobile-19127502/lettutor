import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/user_bloc/user_bloc.dart';
import 'package:lettutor/constants/font_const.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ApprovalPage extends StatefulWidget {
  const ApprovalPage({Key? key}) : super(key: key);

  @override
  State<ApprovalPage> createState() => _ApprovalPageState();
}

class _ApprovalPageState extends State<ApprovalPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/smiley_face.png",
          width: 100,
          fit: BoxFit.fill,
        ),
        Text(
          BlocProvider.of<UserBloc>(context)
                          .accountInfo
                          ?.user
                          ?.tutorInfo
                          ?.isActivated ==
                      null ||
                  BlocProvider.of<UserBloc>(context)
                          .accountInfo
                          ?.user
                          ?.tutorInfo
                          ?.isActivated ==
                      false
              ? "${AppLocalizations.of(context)!.haveDoneAllTheStep} \n"
                  "${AppLocalizations.of(context)!.plsWaitForApprove}"
              : "You are already a teacher",
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(
              textStyle: FontConst.medium.copyWith(fontSize: 21)),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Back to home"))
      ],
    );
  }
}
