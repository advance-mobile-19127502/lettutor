import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor_info.dart';
import 'package:provider/provider.dart';

class AvatarAndHeartWidget extends StatefulWidget {

  const AvatarAndHeartWidget({Key? key}) : super(key: key);

  @override
  State<AvatarAndHeartWidget> createState() => _AvatarAndHeartWidgetState();
}

class _AvatarAndHeartWidgetState extends State<AvatarAndHeartWidget> {
  late Tutor tutor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tutor = Provider.of<Tutor>(context, listen: false);

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(tutor.ava_url),
          ),
        ),
        Positioned(
            right: 0,
            child: IconButton(
              onPressed: () {
                tutor.setFavorite(!tutor.isFavorite);
              },
              icon: tutor.isFavorite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              color: tutor.isFavorite ? Colors.red : Colors.blue,
            ))
      ],
    );
  }
}
