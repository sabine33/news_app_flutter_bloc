import 'package:flutter/material.dart';

import '../../models/user_model.dart';

Widget getUserCard(User user) {
  return Container(
    width: 300,
    child: Card(
      child: ListTile(
        title: Text(user.username),
        subtitle: Text(user.email),
      ),
    ),
  );
}
