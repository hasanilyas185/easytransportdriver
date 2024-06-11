import 'package:easy_transport_driver/cubits/notification/cubit.dart';
import 'package:easy_transport_driver/screens/full_screen_loader.dart';
import 'package:easy_transport_driver/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'widgets/add_notification_ui_actions.dart';

class AddnotificationsScreen extends StatefulWidget {
  const AddnotificationsScreen({super.key});

  @override
  _AddnotificationsScreenState createState() => _AddnotificationsScreenState();
}

class _AddnotificationsScreenState extends State<AddnotificationsScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  bool isActive = false;
  DateTime? validFrom;
  DateTime? validTo;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          isStartDate ? validFrom ?? DateTime.now() : validTo ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != (isStartDate ? validFrom : validTo)) {
      setState(() {
        if (isStartDate) {
          validFrom = picked;
        } else {
          validTo = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final notificationCubit = NotificationCubit.c(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text('Add Notification'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomeScreen()));
          return false;
        },
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter title';
                        }
                        return null;
                      },
                      onSaved: (value) => title = value!,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description';
                        }
                        return null;
                      },
                      onSaved: (value) => description = value!,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Valid From',
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      controller: TextEditingController(
                          text: validFrom == null
                              ? ''
                              : DateFormat('yyyy-MM-dd').format(validFrom!)),
                      onTap: () {
                        _selectDate(context, true);
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Valid To',
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      controller: TextEditingController(
                          text: validTo == null
                              ? ''
                              : DateFormat('yyyy-MM-dd').format(validTo!)),
                      onTap: () {
                        _selectDate(context, false);
                      },
                    ),
                    const SizedBox(height: 16.0),
                    SwitchListTile(
                      title: const Text('Is Active?'),
                      value: isActive,
                      onChanged: (bool value) {
                        setState(() {
                          isActive = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24.0),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue[900],
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Process the saved data

                            final map = {
                              "Title": title,
                              "Description": description,
                              "ValidFrom": validFrom != null
                                  ? DateFormat('yyyy-MM-dd').format(validFrom!)
                                  : '',
                              "ValidTill": validTo != null
                                  ? DateFormat('yyyy-MM-dd').format(validTo!)
                                  : '',
                              "Status": isActive ? "active" : "inactive",
                            };
                            notificationCubit.addNotification(map);
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const AddNotificationUIActions(),
          ],
        ),
      ),
    );
  }
}
