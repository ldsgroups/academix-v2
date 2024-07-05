import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget csAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    leadingWidth: 72,
    titleSpacing: 0,
    leading: const DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            'https://images.unsplash.com/photo-1502236876560-243e78f715f7?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
        ),
      ),
    ),
    title: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bonjour, 🖐️', style: TextStyle(fontSize: 14)),
        Text('Darius Kassi'),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications),
      ),
      const SizedBox(width: 10),
    ],
  );
}
