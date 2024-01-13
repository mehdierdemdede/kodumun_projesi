import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter_application_2/data/users.dart';
import 'package:flutter_application_2/model/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// Create a Form widget.
class LeadDetailSoldedPage extends StatefulWidget {
  const LeadDetailSoldedPage({super.key});

  @override
  LeadDetailSoldedPageState createState() {
    return LeadDetailSoldedPageState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class LeadDetailSoldedPageState extends State<LeadDetailSoldedPage> {
  late List<User> users;
  bool isChecked = false;
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
            const FractionallySizedBox(
              widthFactor: 1,
              child: Banner(
                location: BannerLocation.topEnd,
                message: 'Solded',
                color: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: Row(
                children: [
                  const Expanded(
                    flex: 5,
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
                        hintText: 'Operation Type',
                      ),
                    ),
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
                        hintText: 'Ticket Date',
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
                        hintText: 'Operation Date',
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
                    hintText: 'Return Date',
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CheckboxListTile(
                    title: const Text('Otel'),
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CheckboxListTile(
                    title: const Text('Otel'),
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ),
              ],
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
