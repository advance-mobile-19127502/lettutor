import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/booking_history_bloc/booking_history_bloc.dart';
import 'package:lettutor/pages/history_page/widgets/history_tile.dart';

class BuildListHistory extends StatefulWidget {
  const BuildListHistory({Key? key}) : super(key: key);

  @override
  State<BuildListHistory> createState() => _BuildListHistoryState();
}

class _BuildListHistoryState extends State<BuildListHistory> {
  late BookingHistoryBloc bookingHistoryBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bookingHistoryBloc = BlocProvider.of<BookingHistoryBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingHistoryBloc, BookingHistoryState>(
      bloc: bookingHistoryBloc,
      builder: (context, state) {
        if (state is BookingHistoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is BookingHistoryError) {
          return const Center(child: Text("Error while fetching data"));
        }
        if (state is BookingHistoryFetchMore) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...bookingHistoryBloc.listBookingHistory.map((e) => Column(
                      children: [
                        HistoryTile(bookingHistory: e),
                        const SizedBox(
                          height: 8,
                        )
                      ],
                    )),
                const CircularProgressIndicator(),
              ]);
        }
        if (state is BookingHistoryEmpty) {
          return Column(children: [
            ...bookingHistoryBloc.listBookingHistory.map((e) => Column(
                  children: [
                    HistoryTile(bookingHistory: e),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                )),
            const Text("No data"),
          ]);
        }
        return Column(
          children: [
            ...bookingHistoryBloc.listBookingHistory.map(
              (e) => HistoryTile(bookingHistory: e),
            ),
          ],
        );
      },
    );
  }
}
