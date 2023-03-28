import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/list_tutor_bloc/list_tutor_bloc.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/home_page/widgets/profile_tile.dart';

class ListTutorWidget extends StatefulWidget {
  const ListTutorWidget({Key? key}) : super(key: key);

  @override
  State<ListTutorWidget> createState() => _ListTutorWidgetState();
}

class _ListTutorWidgetState extends State<ListTutorWidget> {
  late ListTutorBloc listTutorBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listTutorBloc = BlocProvider.of<ListTutorBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListTutorBloc, ListTutorState>(
        bloc: listTutorBloc,
        builder: (context, state) {
          if (state is ListTutorLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ListTutorSuccess) {
            return Column(
              children: [
                ...listTutorBloc.listTutor
                    .map((e) => ProfileTile(tutorInfo: e)),
              ],
            );
          }
          if (state is ListTutorFetchMore) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...listTutorBloc.listTutor.map((e) => Column(
                        children: [
                          ProfileTile(tutorInfo: e),
                          const SizedBox(
                            height: 8,
                          )
                        ],
                      )),
                  const CircularProgressIndicator(),
                ]);
          }
          if (state is ListTutorEmpty) {
            return Column(children: [
              ...listTutorBloc.listTutor.map((e) => Column(
                    children: [
                      ProfileTile(tutorInfo: e),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  )),
              const Text("No data"),
            ]);
          }
          return const Center(child: Text("Error while fetching data"));
        });
  }
}
