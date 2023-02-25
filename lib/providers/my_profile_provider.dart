


import 'package:flutter/foundation.dart';
import 'package:lettutor/models/profile.dart';

class MyProfileProvider extends ChangeNotifier {
  late Profile myProfile;



  changeProfile(Profile newProfile)
  {
    myProfile = newProfile;
    notifyListeners();
  }

  Profile getProfile(){
    return myProfile;
  }

}