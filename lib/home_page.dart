import 'package:flutter/material.dart';
import 'package:travellapp/sections/home/app_bar.dart';
import 'package:travellapp/sections/home/discover/discover_section.dart';
import 'package:travellapp/sections/home/explore_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        appBar: homeAppBar(),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            discoverSection(tabController),
            const SizedBox(height: 16,),
            exploreSection()
          ],
        )
        );
  }

}

