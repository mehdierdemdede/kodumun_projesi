import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class User {
  String fullName;
  String formName;
  DateTime date;
  String phoneNumber;
  String interest;
  String status;
  double price;
  DateTime interestDate;
  String note;

  User({
    required this.fullName,
    required this.formName,
    required this.date,
    required this.phoneNumber,
    required this.interest,
    required this.status,
    required this.price,
    required this.interestDate,
    required this.note,
  });
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EditPage(),
    );
  }
}

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  EditPageState createState() => EditPageState();
}

class EditPageState extends State<EditPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController formNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController interestDateController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  // Sample user data for demonstration purposes
  User user = User(
    fullName: 'John Doe',
    formName: 'Appointment Form',
    date: DateTime.now(),
    phoneNumber: '123-456-7890',
    interest: 'Hair Transplant',
    status: 'Hot',
    price: 1500.0,
    interestDate: DateTime.now(),
    note: 'Interested in hair transplant procedure.',
  );

  List<String> statusOptions = ['Hot', 'Not Answered', 'Blocked', 'Solded'];
  List<String> interestOptions = ['Hair Transplant', 'Rhinoplasty'];

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing user data
    fullNameController.text = user.fullName;
    formNameController.text = user.formName;
    dateController.text = user.date.toString();
    phoneNumberController.text = user.phoneNumber;
    interestController.text = user.interest;
    statusController.text = user.status;
    priceController.text = user.price.toString();
    interestDateController.text = user.interestDate.toString();
    noteController.text = user.note;
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            // Set the background color of the calendar header
            primaryColor: Colors.blue,
            hintColor: Colors.blue, // Add this line
            colorScheme: const ColorScheme.light(primary: Colors.blue),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != DateTime.parse(controller.text)) {
      setState(() {
        controller.text = picked.toString().split(' ')[0]; // Only date, no time
      });
    }
  }

  // Function to update user information
  void updateUser() {
    setState(() {
      user.fullName = fullNameController.text;
      user.formName = formNameController.text;
      user.date = DateTime.parse(dateController.text);
      user.phoneNumber = phoneNumberController.text;
      user.interest = interestController.text;
      user.status = statusController.text;
      user.price = double.parse(priceController.text);
      user.interestDate = DateTime.parse(interestDateController.text);
      user.note = noteController.text;
      // Perform the actual update logic here, e.g., call an API or update a database
    });
    // Optionally, you can show a success message or navigate back to the previous screen
    // after updating the user information.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Full Name and Icons in the same row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: fullNameController,
                    decoration: const InputDecoration(labelText: 'Full Name'),
                  ),
                ),
                const SizedBox(width: 16),
                const FaIcon(
                  FontAwesomeIcons.phone,
                  size: 30,
                ),
                const SizedBox(width: 16),
                const FaIcon(
                  FontAwesomeIcons.whatsapp,
                  size: 30,
                ),
                const SizedBox(width: 16),
                const FaIcon(
                  FontAwesomeIcons.addressCard,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Form Name in one row
            TextField(
              controller: formNameController,
              decoration: const InputDecoration(labelText: 'Form Name'),
            ),
            const SizedBox(height: 16),

            // Phone Number and Date in the same row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: phoneNumberController,
                    decoration:
                        const InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: dateController,
                    readOnly: true,
                    onTap: () => _selectDate(dateController),
                    decoration: const InputDecoration(labelText: 'Date'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Status and Interest in the same row
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: statusController.text,
                    items: statusOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          color: getStatusColor(value),
                          alignment: Alignment.center,
                          width: 150,
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        statusController.text = value!;
                      });
                    },
                    decoration: const InputDecoration(labelText: 'Status'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: interestController.text,
                    items: interestOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        interestController.text = value!;
                      });
                    },
                    decoration: const InputDecoration(labelText: 'Interest'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Price and Interest Date in the same row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: priceController,
                    decoration: const InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: interestDateController,
                    readOnly: true,
                    onTap: () => _selectDate(interestDateController),
                    decoration:
                        const InputDecoration(labelText: 'Interest Date'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Note alone in a row
            TextField(
              controller: noteController,
              decoration: const InputDecoration(labelText: 'Note'),
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: updateUser,
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'Hot':
        return Colors.red.shade700;
      case 'Blocked':
        return Colors.blue.shade700;
      case 'Not Answered':
        return Colors.amber;
      case 'Solded':
        return Colors.green;
      default:
        return Colors
            .grey; // You can set a default color or choose another color for unknown statuses
    }
  }
}
