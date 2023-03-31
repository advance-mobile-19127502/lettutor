import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/list_tutor_bloc/list_tutor_bloc.dart';
import 'package:lettutor/models/from_api/tutor_info_pagination.dart';

class AvatarAndHeartWidget extends StatefulWidget {
  const AvatarAndHeartWidget({Key? key, required this.tutorInfo})
      : super(key: key);
  final TutorInfoPagination tutorInfo;

  @override
  State<AvatarAndHeartWidget> createState() => _AvatarAndHeartWidgetState();
}

class _AvatarAndHeartWidgetState extends State<AvatarAndHeartWidget> {
  late ListTutorBloc listTutorBloc;

  @override
  void initState() {
    super.initState();
    listTutorBloc = BlocProvider.of<ListTutorBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListTutorBloc, ListTutorState>(
      bloc: listTutorBloc,
      builder: (context, state) {
        return Stack(
          children: [
            Center(
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(40),
                  child: Image.network(
                    widget.tutorInfo.avatar ??
                        "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ",
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return Image.network(
                          "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ");
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () {
                  listTutorBloc
                      .add(FavoriteTutorEvent(widget.tutorInfo.userId!));
                },
                icon: listTutorBloc.listFavoriteTutor.any(
                        (element) => element.userId == widget.tutorInfo.userId)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
                color: listTutorBloc.listFavoriteTutor.any(
                        (element) => element.userId == widget.tutorInfo.userId)
                    ? Colors.red
                    : Colors.blue,
              ),
            )
          ],
        );
      },
    );
  }
}
