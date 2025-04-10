import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../app_strings.dart';
import '../../models/game_model.dart';
import '../../route/name_routes.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(AppStrings.colGames)
            .where("startDate", isGreaterThanOrEqualTo: DateTime.now())
            .orderBy("startDate")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: Text("Nothing to show"),
            );
          }
          List<GameModel> mGame = GameModel.fromSnapshot(snapshot.data!);
          return ListView.separated(
            itemCount: mGame.length,
            padding: const EdgeInsets.only(top: 16),
            itemBuilder: (_, int index) {
              final GameModel game = mGame[index];

              String startDate = DateFormat("MMM d").format(game.startDate);
              String endDate = DateFormat("MMM d").format(game.endDate);

              return GestureDetector(
                onTap: () {
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 80,
                            child: game.imagePath != null &&
                                game.imagePath!.isNotEmpty
                                ? Image.network(
                              game.imagePath!,
                              width: 80,
                              fit: BoxFit.contain,
                            )
                                : const Placeholder(
                              fallbackHeight: 40,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    game.title,
                                    style: textTheme.titleLarge
                                        ?.copyWith(color: Colors.blue),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        game.calculateDuration(),
                                        style: textTheme.bodyMedium
                                            ?.copyWith(color: Colors.blue),
                                      ),
                                      const Text(" . "),
                                      Text("$startDate - $endDate"),
                                    ],
                                  ),
                                  Text(game.description),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "\$${game.competition}",
                                  style: textTheme.bodyMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                                Text(
                                  "Competition",
                                  style: textTheme.bodyMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "${game.users?.length ?? 0}",
                                  style: textTheme.bodyMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                                Text(
                                  "Players",
                                  style: textTheme.bodyMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "\$${(game.users?.length ?? 0) * game.competition}",
                                  style: textTheme.bodyMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                                Text(
                                  "Pot",
                                  style: textTheme.bodyMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) {
              return const Divider(
                color: Colors.grey,
                thickness: 2,
              );
            },
          );
        });
  }

  Future<void> insertGamesToDatabase() async {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    // Firestore collection reference
    CollectionReference gamesCollection =
        FirebaseFirestore.instance.collection(AppStrings.colGames);

    try {
      for (var game in games) {
        // Create a new document reference for each game
        DocumentReference gameRef = gamesCollection.doc();
        game.currentDocument = gameRef.id;

        batch.set(gameRef, game.toMap());
      }

      await batch.commit();
      print("All games inserted successfully!");
    } catch (e) {
      print("Failed to insert games: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    // insertGamesToDatabase();
  }
}
