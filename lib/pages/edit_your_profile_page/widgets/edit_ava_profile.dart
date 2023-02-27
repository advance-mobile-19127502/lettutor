

import 'package:flutter/material.dart';
import 'package:lettutor/data/my_profile.dart';

class EditAvaProfile extends StatefulWidget {
  const EditAvaProfile({Key? key}) : super(key: key);

  @override
  State<EditAvaProfile> createState() => _EditAvaProfileState();
}

class _EditAvaProfileState extends State<EditAvaProfile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(myProfile.avaUrl),
            child: const Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
