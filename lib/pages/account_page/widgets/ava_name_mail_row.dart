import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/user_bloc.dart';
import 'package:lettutor/bloc/user_bloc.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:shimmer/shimmer.dart';

class AvaNameMailRowWidget extends StatefulWidget {
  const AvaNameMailRowWidget({Key? key}) : super(key: key);

  @override
  State<AvaNameMailRowWidget> createState() => _AvaNameMailRowWidgetState();
}

class _AvaNameMailRowWidgetState extends State<AvaNameMailRowWidget> {
  late UserBloc userBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userBloc = BlocProvider.of<UserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      bloc: userBloc,
      builder: (context, state) {
        if (state is UserSuccess) {
          return Row(
            children: [
              ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(40),
                  child: Image.network(
                    userBloc.accountInfo?.user?.avatar ??
                        "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ",
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return Image.network(
                          "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ");
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: StyleConst.kDefaultPadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userBloc.accountInfo?.user?.name ?? "",
                    style: GoogleFonts.roboto(
                        textStyle: FontConst.medium.copyWith(fontSize: 15)),
                  ),
                  Text(
                    userBloc.accountInfo?.user?.email ?? "",
                    style: GoogleFonts.roboto(
                        textStyle: FontConst.regular.copyWith(
                            fontSize: 12, color: ColorConst.greyTextColor)),
                  )
                ],
              )
            ],
          );
        }
        if (state is UserError) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 8,
            child: const Text("Failed to get account Info"),
          );
        }
        return shimmerLoadingUserInfo();
      },
    );
  }

  Shimmer shimmerLoadingUserInfo() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(40),
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: StyleConst.kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  height: 15,
                  width: MediaQuery.of(context).size.width / 3,
                ),
                const SizedBox(
                  height: StyleConst.kDefaultPadding / 2,
                ),
                Container(
                  color: Colors.white,
                  height: 12,
                  width: MediaQuery.of(context).size.width / 3,
                ),
              ],
            )
          ],
        ));
  }
}
