// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sample_statemanagent/provider/home_provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Screen"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                index == 0 ? "Buka Halaman Home" : "Buka Halaman Search",
              ),
              onTap: () {
                context.read<HomeProvider>().setPage(index);
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    );
  }
}
