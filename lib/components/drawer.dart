import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget drawer(BuildContext context) {
  return SizedBox(
    width: 150,
    child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: null,
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              context.go('/');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Tutorial'),
            onTap: () {
              context.go('/tutorial');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Easy'),
            onTap: () {
              context.go('/easy');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Medium'),
            onTap: () {
              context.go('/medium');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Hard'),
            onTap: () {
              context.go('/hard');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}
