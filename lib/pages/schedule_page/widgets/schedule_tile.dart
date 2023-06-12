import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/bloc/booking_history_bloc/booking_history_bloc.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/from_api/booking_history.dart';
import 'package:lettutor/pages/schedule_page/widgets/ava_name_schedule_container.dart';
import 'package:lettutor/pages/schedule_page/widgets/request_schedule_container.dart';

class ScheduleTile extends StatefulWidget {
  const ScheduleTile({Key? key, required this.bookingHistory})
      : super(key: key);
  final BookingHistory bookingHistory;

  @override
  State<ScheduleTile> createState() => _ScheduleTileState();
}

class _ScheduleTileState extends State<ScheduleTile> {
  late BookingHistoryBloc bookingHistoryBloc;

  DateFormat timeFormat = DateFormat("hh:mm");
  final dateFormat = DateFormat("EEE, dd MMM yy");

  @override
  void initState() {
    super.initState();
    bookingHistoryBloc = BlocProvider.of<BookingHistoryBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingHistoryBloc, BookingHistoryState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: StyleConst.kDefaultPadding),
          child: Container(
            padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 2),
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateFormat.format(DateTime.fromMillisecondsSinceEpoch(widget
                      .bookingHistory
                      .scheduleDetailInfo!
                      .startPeriodTimestamp!)),
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.medium.copyWith(fontSize: 24)),
                ),
                const SizedBox(
                  height: StyleConst.kDefaultPadding / 2,
                ),
                AvaNameScheduleContainer(
                  tutorInfo: widget.bookingHistory.scheduleDetailInfo!
                      .scheduleInfo!.tutorInfo!,
                ),
                const SizedBox(
                  height: StyleConst.kDefaultPadding / 2,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 2),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Text(
                    "Lesson Time: ${DateFormat("HH-mm").format(DateTime.fromMillisecondsSinceEpoch(widget.bookingHistory.scheduleDetailInfo!.startPeriodTimestamp!))}"
                    " - ${DateFormat("HH-mm").format(DateTime.fromMillisecondsSinceEpoch(widget.bookingHistory.scheduleDetailInfo!.endPeriodTimestamp!))}",
                    style: GoogleFonts.roboto(
                        textStyle: FontConst.regular.copyWith(fontSize: 20)),
                  ),
                ),
                const SizedBox(
                  height: StyleConst.kDefaultPadding / 2,
                ),
                ElevatedButton(
                    onPressed: () {
                      bookingHistoryBloc.add(
                          CancelBookedClassEvent(widget.bookingHistory.id!));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.red,
                        )),
                    child: state is CancelBookingHistoryLoading &&
                            state.scheduleId == widget.bookingHistory.id
                        ? Transform.scale(
                            scale: 0.5,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.cancel_outlined,
                                color: Colors.red,
                              ),
                              Text(
                                "Cancel",
                                style: GoogleFonts.roboto(
                                    textStyle: FontConst.regular
                                        .copyWith(color: Colors.red)),
                              )
                            ],
                          )),
                const SizedBox(
                  height: StyleConst.kDefaultPadding / 2,
                ),
                RequestScheduleContainer(bookingHistory: widget.bookingHistory),
              ],
            ),
          ),
        );
      },
    );
  }
}
