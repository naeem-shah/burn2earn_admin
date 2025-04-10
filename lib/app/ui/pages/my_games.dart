import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../models/game_model.dart';
import '../../route/name_routes.dart';

class MyGames extends StatefulWidget {
  const MyGames({super.key});

  @override
  State<MyGames> createState() => _MyGamesState();
}

class _MyGamesState extends State<MyGames> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    List<GameModel> joinedGames = games;
    // List<GameModel> joinedGames = games.where((e)=> e.isJoined).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Games"),
      ),
      body: ListView.separated(
        itemCount: joinedGames.length,
        itemBuilder: (_, int index) {
          final GameModel game = joinedGames[index];

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
                        child: game.imagePath != null
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
                                  // Text(
                                  //   game.duration,
                                  //   style: textTheme.bodyMedium
                                  //       ?.copyWith(color: Colors.blue),
                                  // ),
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                            // Text(
                            //   "${game.players}",
                            //   style: textTheme.bodyMedium
                            //       ?.copyWith(color: Colors.white),
                            // ),
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
                            // Text(
                            //   "\$${game.players * game.competition}",
                            //   style: textTheme.bodyMedium
                            //       ?.copyWith(color: Colors.white),
                            // ),
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
      ),
    );
  }
}
