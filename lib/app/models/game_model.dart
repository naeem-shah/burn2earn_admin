import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../auth/auth_utils.dart';

class GameModel {
  String title;
  String? imagePath;
  DateTime startDate;
  DateTime endDate;
  String description;
  int competition;
  int pot;
  List<String>? users;
  String? currentDocument;
  Timestamp? timestamp;

  GameModel({
    required this.title,
    this.imagePath,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.competition,
    required this.pot,
    this.users,
    this.currentDocument,
    this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imagePath': imagePath ?? "",
      'startDate': Timestamp.fromDate(startDate),
      'endDate': Timestamp.fromDate(endDate),
      'description': description,
      'competition': competition,
      'pot': pot,
      'users': users?.map((ref) => ref).toList() ?? [],
      'timestamp': FieldValue.serverTimestamp(),
    };
  }

  // Convert Firestore data to GameModel instance
  factory GameModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return GameModel(
      title: data['title'],
      imagePath: data['imagePath'],
      description: data['description'],
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
      competition: data['competition'],
      pot: data['pot'],
      users: (data['users'] as List<dynamic>).map((e){
        return e as String;
      }).toList(),
      currentDocument: doc.reference.id,
      timestamp: data['timestamp'],
    );
  }

  // Function to convert snapshot to a list of GameModel
  static List<GameModel> fromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) => GameModel.fromFirestore(doc)).toList();
  }

  String calculateDuration() {
    final duration = endDate.difference(startDate);
    final days = duration.inDays;

    // Calculate weeks and months
    final weeks = (days / 7).floor();
    final months = (days / 30).floor();

    // Return the largest unit as a string
    if (months >= 1) {
      return '$months month${months > 1 ? 's' : ''}';
    } else if (weeks >= 1) {
      return '$weeks week${weeks > 1 ? 's' : ''}';
    } else {
      return '$days day${days > 1 ? 's' : ''}';
    }
  }

  bool get isJoined => users?.contains(currentUserUid) ?? false;
}

List<GameModel> games = [
  GameModel(
    title: "Walk to win",
    imagePath:
        "https://www.healthifyme.com/blog/wp-content/uploads/2022/06/Morning-Walking-1.jpg",
    startDate: DateTime(2023, 07, 16),
    endDate: DateTime(2023, 08, 25),
    description:
        "Walk more for 6 weeks to win! Everyone who meets their goals splits the pot.",
    competition: 10,
    pot: 100,
  ),
  GameModel(
    title: "Summer Steps",
    imagePath:
        "https://bcgreencare.ca/wp-content/uploads/2023/07/AdobeStock_126003691-scaled.jpeg",
    startDate: DateTime(2023, 06, 01),
    endDate: DateTime(2023, 06, 29),
    description: "Get moving this summer and earn your share of the pot!",
    competition: 15,
    pot: 120,
  ),
  GameModel(
    title: "Autumn Adventure",
    imagePath:
        "https://assets.simpleviewinc.com/simpleview/image/upload/c_limit,h_1200,q_75,w_1200/v1/clients/poconos/Hiking_Group_Lehigh_Gorge_16_PoconoMtns_afc8aba9-8f1b-40d3-8bd3-2a538a6695d9.jpg",
    // Replace with a valid URL
    startDate: DateTime(2023, 09, 01),
    endDate: DateTime(2023, 10, 27),
    description: "Explore the outdoors and walk your way to victory!",
    competition: 20,
    pot: 240,
  ),
  GameModel(
    title: "Winter Walkathon",
    startDate: DateTime(2023, 12, 01),
    endDate: DateTime(2024, 01, 05),
    description: "Don’t let the cold stop you! Walk for 5 weeks to win.",
    competition: 12,
    pot: 180,
  ),
  GameModel(
    title: "Spring Sprint",
    startDate: DateTime(2023, 04, 10),
    endDate: DateTime(2023, 04, 30),
    description: "A quick 3-week sprint to boost your steps this spring.",
    competition: 10,
    pot: 200,
  ),
  GameModel(
    title: "Fitness Frenzy",
    startDate: DateTime(2023, 03, 01),
    endDate: DateTime(2023, 04, 19),
    description: "Join the frenzy! Walk for 7 weeks to win big.",
    competition: 25,
    pot: 125,
  ),
  GameModel(
    title: "Step Challenge",
    startDate: DateTime(2023, 08, 01),
    endDate: DateTime(2023, 09, 12),
    description: "Challenge yourself to reach new step goals every day.",
    competition: 18,
    pot: 180,
  ),
  GameModel(
    title: "March Madness",
    startDate: DateTime(2023, 03, 05),
    endDate: DateTime(2023, 04, 02),
    description: "March into fitness with this 4-week step challenge.",
    competition: 14,
    pot: 168,
  ),
  GameModel(
    title: "Healthy Habits",
    startDate: DateTime(2023, 05, 15),
    endDate: DateTime(2023, 07, 24),
    description: "Build healthy habits with this long-term step challenge.",
    competition: 30,
    pot: 210,
  ),
  GameModel(
    title: "Holiday Hustle",
    startDate: DateTime(2023, 11, 20),
    endDate: DateTime(2024, 01, 01),
    description: "Stay active during the holidays with this 6-week game.",
    competition: 20,
    pot: 300,
  ),
];
