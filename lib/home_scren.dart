// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sample_statemanagent/notification_screen.dart';
import 'package:sample_statemanagent/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// Panggil initial provider nya
    context.read<HomeProvider>().initialized(this);
  }

  @override
  Widget build(BuildContext context) {
    /// Listen semua perubahan controller nya di dalam providernya
    final homeProv = context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Provider"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => NotificationScreen()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          TabBar(
            controller: homeProv.controller,
            labelColor: Colors.blue,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.search),
                text: 'Search',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: homeProv.controller,
              children: [
                Center(
                  child: Text("Home"),
                ),
                Center(
                  child: Text("Search"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
