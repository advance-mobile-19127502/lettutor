import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/bloc/booking_bloc/booking_bloc.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/balance_price_container.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/booking_time_container.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/header_dialog.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/note_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BookingDialog extends StatefulWidget {
  const BookingDialog({Key? key, required this.appointment}) : super(key: key);
  final Appointment appointment;

  @override
  State<BookingDialog> createState() => _BookingDialogState();
}

class _BookingDialogState extends State<BookingDialog> {
  late TextEditingController noteTextController;
  late BookingBloc bookingBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    noteTextController = TextEditingController();
    bookingBloc = BlocProvider.of<BookingBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingBloc, BookingState>(
      listener: (context, state) {
        if (state is BookingSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
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
                BookingTimeContainer(
                    timeStudy:
                        '${DateFormat('hh:mm').format(widget.appointment.startTime)} - ${DateFormat(
                  'hh:mm EEEE, dd MMMM y',
                ).format(widget.appointment.endTime)}'),
                const BalancePriceContainer(balance: 5, price: 0),
                NoteContainer(
                  noteTextController: noteTextController,
                ),
                if (state is BookingError)
                  Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
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
                          onPressed: state is BookingLoading
                              ? null
                              : () {
                                  bookingBloc.add(BookingTutorEvent(
                                      widget.appointment.id as String,
                                      noteTextController.text));
                                },
                          child: state is BookingLoading
                              ? const SizedBox(
                                  width: 14,
                                  height: 14,
                                  child: CircularProgressIndicator(),
                                )
                              : Text(AppLocalizations.of(context)!.book))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
