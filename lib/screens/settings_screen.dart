import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _enableNotifications = true;
  bool _enableDarkMode = false;
  bool _enableAnalytics = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: _enableNotifications,
            onChanged: (value) {
              setState(() {
                _enableNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Enable Dark Mode'),
            value: _enableDarkMode,
            onChanged: (value) {
              setState(() {
                _enableDarkMode = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Enable Analytics'),
            value: _enableAnalytics,
            onChanged: (value) {
              setState(() {
                _enableAnalytics = value;
              });
            },
          ),
          SizedBox(height: 16),
          Text(
            'Data Usage',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          ListTile(
            title: Text('Download Only on Wi-Fi'),
            subtitle: Text('Downloads will only occur on Wi-Fi networks.'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: navigate to Wi-Fi settings page
            },
          ),
          ListTile(
            title: Text('Clear Cache'),
            subtitle: Text('Clears all locally stored data and files.'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: implement cache clearing functionality
            },
          ),
        ],
      ),
    );
  }
}