import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationEnabled = true;
  bool _darkModeEnabled = false;

  void _toggleNotification(bool value) {
    setState(() {
      _notificationEnabled = value;
    });
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      _darkModeEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Notifications'),
              trailing: Switch(
                value: _notificationEnabled,
                onChanged: _toggleNotification,
              ),
            ),
            ListTile(
              title: Text('Dark Mode'),
              trailing: Switch(
                value: _darkModeEnabled,
                onChanged: _toggleDarkMode,
              ),
            ),
          ],
        
      ),
    );
  }
}
