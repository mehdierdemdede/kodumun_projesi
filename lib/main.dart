// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_application_2/page/leads_page.dart';
import 'package:flutter_application_2/page/lead_detail_page.dart';
import 'package:flutter_application_2/widget/tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'page/lead_detail_solded_page.dart';
import 'page/test.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Bizim App :)';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: const MainPage(),
      );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Bir garip app',
        tabs: const [
          Tab(icon: Icon(Icons.sort_by_alpha), text: 'Leads'),
          Tab(icon: Icon(Icons.edit), text: 'Configure'),
          Tab(icon: Icon(Icons.report), text: 'Report'),
          Tab(icon: Icon(Icons.select_all), text: 'KK'),
          Tab(icon: Icon(Icons.select_all), text: 'TEST'),
          Tab(icon: Icon(Icons.select_all), text: 'TEST2'),
          Tab(icon: Icon(Icons.select_all), text: 'TEST3'),
        ],
        children: [
          const LeadsPage(),
          Container(),
          Container(),
          Container(),
          const LeadDetailPage(),
          const LeadDetailSoldedPage(),
          const Test(),
        ],
      );
}
