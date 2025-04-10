class Competition {
  final String participant1Name;
  final String participant1AvatarUrl;
  final int participant1Steps;

  final String participant2Name;
  final String participant2AvatarUrl;
  final int participant2Steps;

  Competition({
    required this.participant1Name,
    required this.participant1AvatarUrl,
    required this.participant1Steps,
    required this.participant2Name,
    required this.participant2AvatarUrl,
    required this.participant2Steps,
  });
}

final List<Competition> competitions = [
  Competition(
    participant1Name: "Ahmed",
    participant1AvatarUrl:
        "https://images.unsplash.com/photo-1506968695017-764f86a9f9ec?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    participant1Steps: 95,
    participant2Name: "Ali",
    participant2AvatarUrl:
        "https://images.unsplash.com/photo-1574667109430-70246edd85bc?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    participant2Steps: 98,
  ),
  Competition(
    participant1Name: "Fatima",
    participant1AvatarUrl:
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    participant1Steps: 120,
    participant2Name: "Ayesha",
    participant2AvatarUrl:
        "https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    participant2Steps: 110,
  ),
  Competition(
    participant1Name: "Hassan",
    participant1AvatarUrl:
        "https://images.unsplash.com/photo-1618256225993-969b636364a3?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    participant1Steps: 80,
    participant2Name: "Zainab",
    participant2AvatarUrl:
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    participant2Steps: 85,
  ),
];
