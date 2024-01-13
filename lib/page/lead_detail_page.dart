import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter_application_2/data/users.dart';
import 'package:flutter_application_2/model/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// Create a Form widget.
class LeadDetailPage extends StatefulWidget {
  const LeadDetailPage({super.key});

  @override
  LeadDetailPageState createState() {
    return LeadDetailPageState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class LeadDetailPageState extends State<LeadDetailPage> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    users = List.of(allUsers);
  }

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.idCard),
                    color: Colors.blue,
                    onPressed: () {
                      setState(
                        () {
                          launchWhatsapp(users.first.number, 'message');
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.whatsapp),
                    color: Colors.green,
                    onPressed: () {
                      setState(
                        () {
                          launchWhatsapp(users.first.number, 'message');
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.phone),
                    color: Colors.blue,
                    onPressed: () {
                      setState(
                        () {
                          launchWhatsapp(users.first.number, 'message');
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Form Name',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Date',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const FractionallySizedBox(
              widthFactor: 0.5,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Phone Number',
                  ),
                ),
              ),
            ),
            const FractionallySizedBox(
              widthFactor: 0.8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Interest',
                  ),
                ),
              ),
            ),
            const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Status',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Price',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Interest Date',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  readOnly: true,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Note',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  launchWhatsapp(
    String phone,
    String message,
  ) async {
    final Uri urlAndroid = Uri.parse('https://wa.me/$phone/?text=$message');
    final Uri urlIos =
        Uri.parse('https://api.whatsapp.com/send?phone=$phone=$message');

    if (Platform.isAndroid) {
      return launchUrl(urlAndroid); // new line
    } else {
      return launchUrl(urlIos); // new line
    }
  }
}
