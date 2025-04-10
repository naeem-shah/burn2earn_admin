import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    List<String> friends = [
      "Aisha",
      "Ali",
      "Fatima",
      "Hassan",
      "Iqbal",
      "Javed",
      "Khalid",
      "Maria",
      "Noor",
      "Omar",
      "Sana",
      "Usman",
      "Zara"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Friends"),
        actions: [
          TextButton.icon(
            onPressed: () {},
            label: const Text("Add Friend"),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        children: [
          Row(
            children: [
              Expanded(
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "3",
                          style: textTheme.headlineSmall,
                        ),
                        Text(
                          "Games",
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "3",
                          style: textTheme.headlineSmall,
                        ),
                        Text(
                          "Friends",
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Friends",
            style: textTheme.titleMedium,
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  String name = friends[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: textTheme.titleMedium,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 4),
                          child: Text(
                            "Add",
                            style: textTheme.titleSmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: friends.length,
                separatorBuilder: (_, __) {
                  return const Divider();
                },
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
