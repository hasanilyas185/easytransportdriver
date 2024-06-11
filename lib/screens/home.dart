import 'package:easy_transport_driver/screens/add_notifications/add_notifications.dart';
import 'package:easy_transport_driver/screens/share_location.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Home',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue[900],
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                ),
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  final userId = prefs.getInt('userId');

                  if (!context.mounted) return;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShareLocation(
                                driverId: userId!,
                              )));
                },
                child: const Text('Share Location'),
              ),
              const SizedBox(
                  height: 20), // Adds a space between the two buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue[900],
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 21),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AddnotificationsScreen()));
                },
                child: const Text('Add Notification'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
