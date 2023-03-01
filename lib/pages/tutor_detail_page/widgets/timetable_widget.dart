import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TimeTableWidget extends StatefulWidget {
  const TimeTableWidget({Key? key}) : super(key: key);

  @override
  State<TimeTableWidget> createState() => _TimeTableWidgetState();
}

class _TimeTableWidgetState extends State<TimeTableWidget> {
  final DateTime _curentDate = DateTime.now();
  final _dayMonthFormat = DateFormat("dd/MM");
  final _dateFormat = DateFormat("EE");
  late DateTime _startDay, _endDay;

  final List<DataColumn> listDataColumn = [];
  final List<DataRow> listDataRow = [];

  List<DateTime> listDayTimeTable = [];

  @override
  void initState() {
    _startDay = _curentDate;
    _endDay = _startDay.add(const Duration(days: 6));

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    _getDateColumn(_curentDate);
    _getDataRow();

  }

  _getDateColumn(DateTime startingDate) {
    listDataColumn.clear();
    listDayTimeTable.clear();
    listDataColumn
        .add(DataColumn(label: Expanded(child: Center(child: Text("Time")))));
    for (int i = 0; i < 7; i++) {
      final tempDate = startingDate.add(Duration(days: i));
      listDayTimeTable.add(tempDate);

      listDataColumn.add(DataColumn(
          label: Expanded(
        child: Center(
          child: Text(
            "${_dayMonthFormat.format(tempDate)}\n"
            "${_dateFormat.format(tempDate).toUpperCase()}",
            textAlign: TextAlign.center,
          ),
        ),
      )));
    }
  }

  _getDataRow() {
    listDataRow.add(DataRow(cells: [DataCell(Text("7:55 - 9:55"))]));
    for (int i = 0; i < 7; i++) {
      listDataRow[0].cells.add(DataCell(i % 2 == 0
          ? ElevatedButton(onPressed: () {}, child: Text(AppLocalizations.of(context)!.book
      ))
          : const SizedBox()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: _startDay.isAtSameMomentAs(_curentDate) ||
                        _startDay.isBefore(_curentDate)
                    ? null
                    : () {
                        _decreaseStartDate();
                        _getDateColumn(_startDay);
                      },
                icon: Icon(Icons.arrow_back_ios)),
            IconButton(
                onPressed: () {
                  _increaseStartDate();
                  _getDateColumn(_startDay);
                },
                icon: Icon(Icons.arrow_forward_ios)),
            Text(
                "${_dayMonthFormat.format(_startDay)} - ${_dayMonthFormat.format(_endDay)}, "
                "${_curentDate.year}")
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
              border: TableBorder.all(
                width: 0.2,
              ),
              columns: listDataColumn,
              rows: listDataRow),
        ),
      ],
    );
  }

  void _increaseStartDate() {
    setState(() {
      _startDay = _startDay.add(const Duration(days: 7));
      _endDay = _startDay.add(const Duration(days: 6));
    });
  }

  void _decreaseStartDate() {
    setState(() {
      _startDay = _startDay.subtract(const Duration(days: 7));
      _endDay = _startDay.subtract(const Duration(days: 6));
    });
  }
}
