import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../route/name_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Drawer(
      backgroundColor: const Color(0xff819F80),
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    "https://www.mockofun.com/wp-content/uploads/2019/12/circle-profile-pic.jpg",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Maha Arif",
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "maha.arif@gmail.com",
                  style: textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            style: ListTileStyle.drawer,
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              style: textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
            onTap: () {
              context.push(editProfileRoute);
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            leading: const Icon(
              Icons.add_circle_rounded,
              color: Colors.white,
            ),
            title: Text(
              "Add games",
              style: textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
            onTap: () {
              context.push(myGamesRoute);
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: Text(
              "Settings",
              style: textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
            onTap: () {
            },
          ),
          ListTile(
            style: ListTileStyle.drawer,
            leading: const Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
            title: Text(
              "Logout",
              style: textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
