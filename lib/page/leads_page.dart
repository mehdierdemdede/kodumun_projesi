// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter_application_2/data/users.dart';
import 'package:flutter_application_2/model/user.dart';
import 'package:flutter_application_2/utils.dart';
import 'package:flutter_application_2/widget/scrollable_widget.dart';
import 'package:flutter_application_2/widget/text_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/report_status.dart';

class LeadsPage extends StatefulWidget {
  const LeadsPage({super.key});

  @override
  _LeadsPageState createState() => _LeadsPageState();
}

class _LeadsPageState extends State<LeadsPage> {
  late List<User> users;
  int? sortColumnIndex;
  bool isAscending = false;
  @override
  void initState() {
    super.initState();

    users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['Name', 'Date', '   Actions', 'Report'];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
        label: Text(column),
        onSort: onSort,
      );
    }).toList();
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.firstName, user2.firstName));
    } else if (columnIndex == 1) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.lastName, user2.lastName));
    } else if (columnIndex == 3) {
      users.sort((user1, user2) => compareString(ascending,
          '${user1.reportStatus.number}', '${user2.reportStatus.number}'));
    }

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [
          user.firstName,
          user.date,
          Row(
            children: <Widget>[
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.idCard),
                color: Colors.blue,
                onPressed: () {
                  setState(
                    () {
                      launchWhatsapp(user.number, 'message');
                    },
                  );
                },
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.whatsapp),
                color: Colors.green,
                onPressed: () {
                  setState(
                    () {
                      launchWhatsapp(user.number, 'message');
                    },
                  );
                },
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.phone),
                color: Colors.blue,
                onPressed: () {
                  setState(
                    () {
                      launchWhatsapp(user.number, 'message');
                    },
                  );
                },
              ),
            ],
          ),
          DropdownButton(
            value: user.reportStatus,
            iconSize: 35,
            onChanged: (ReportStatus? newValue) {
              setState(() {
                user.reportStatus = newValue!;
              });
            },
            items: ReportStatus.values.map((ReportStatus rs) {
              return DropdownMenuItem(
                value: rs,
                child: Container(
                  height: 30,
                  width: 100,
                  color: rs == ReportStatus.hot
                      ? Colors.red.shade700
                      : rs == ReportStatus.blocked
                          ? Colors.blue.shade700
                          : Colors.amber,
                  alignment: Alignment.center,
                  child: Text(rs.value),
                ),
              );
            }).toList(),
          )
        ];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 1;
            final showIcon = (index == 2 || index == 3);

            return DataCell(
              showIcon ? cell as Widget : Text('$cell'),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 1:
                    editDate(user);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editFirstName(User editUser) async {
    final firstName = await showTextDialog(
      context,
      title: 'Change First Name',
      value: editUser.firstName,
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(firstName: firstName) : user;
        }).toList());
  }

  Future editDate(User editUser) async {
    final date = await showTextDialog(
      context,
      title: 'Change Date',
      value: editUser.date,
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(date: date) : user;
        }).toList());
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
