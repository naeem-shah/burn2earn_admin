import 'package:cloud_firestore/cloud_firestore.dart';

import '../app_strings.dart';

CollectionReference gamesCollection =
    FirebaseFirestore.instance.collection(AppStrings.colGames);

CollectionReference usersCollection =
    FirebaseFirestore.instance.collection(AppStrings.colUsers);
