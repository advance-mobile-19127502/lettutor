import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/balance_price_container.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/booking_time_container.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/header_dialog.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/note_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookingDialog extends StatefulWidget {
  const BookingDialog({Key? key}) : super(key: key);

  @override
  State<BookingDialog> createState() => _BookingDialogState();
}

class _BookingDialogState extends State<BookingDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(StyleConst.defaultRadius))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderDialog(
                headerTitle: AppLocalizations.of(context)!.bookingDetail),
            const BookingTimeContainer(
                timeStudy: "10:00 - 10:25 Friday, 03 March 2023"),
            const BalancePriceContainer(balance: 5, price: 0),
            const NoteContainer(),
            Padding(
              padding: const EdgeInsets.only(
                  right: StyleConst.kDefaultPadding,
                  bottom: StyleConst.kDefaultPadding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(AppLocalizations.of(context)!.cancel)),
                  const SizedBox(
                    width: StyleConst.kDefaultPadding,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(AppLocalizations.of(context)!.book))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
