import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/common_widget/icon_text_btn.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/models/tutor_info.dart';
import 'package:provider/provider.dart';

class FavoriteReportReviewRow extends StatefulWidget {
  const FavoriteReportReviewRow({Key? key}) : super(key: key);

  @override
  State<FavoriteReportReviewRow> createState() =>
      _FavoriteReportReviewRowState();
}

class _FavoriteReportReviewRowState extends State<FavoriteReportReviewRow> {
  late Tutor tutor;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    tutor = Provider.of<Tutor>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Consumer<Tutor>(
          builder: (context, tutor, child) => InkWell(
            onTap: () {
              tutor.setFavorite(!tutor.isFavorite);
            },
            child: Column(
              children: [
                Icon(
                  tutor.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: tutor.isFavorite ? Colors.red : Colors.blue,
                ),
                Text(
                  "Favorites",
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.medium.copyWith(
                          fontSize: 13,
                          color: tutor.isFavorite ? Colors.red : Colors.blue)),
                )
              ],
            ),
          ),
        ),
        IconTextButton(
            title: "Report", icon: Icons.report_gmailerrorred, onPress: () {}),
        IconTextButton(
            title: "Review", icon: Icons.star_border_outlined, onPress: () {}),
      ],
    );
  }
}
