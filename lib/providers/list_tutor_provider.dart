import 'package:flutter/foundation.dart';
import 'package:lettutor/data/list_tutor.dart';
import 'package:lettutor/models/tutor_info.dart';

class ListTutorProvider with ChangeNotifier {
  List<Tutor> _listTutor = [];

  List<Tutor> get getListTutor => _listTutor;



  setListTutor(List<Tutor> newListTutor) {
    _listTutor = newListTutor;
  }

  setFavoriteAt(Tutor tutor) {
    int tutorIndex = _listTutor.indexOf(tutor);
    _listTutor[tutorIndex].isFavorite = !_listTutor[tutorIndex].isFavorite;
    notifyListeners();
  }
}
