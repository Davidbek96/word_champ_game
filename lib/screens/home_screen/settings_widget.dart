import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  bool _enableNotifications = true;
  bool _enableDarkMode = false;
  bool _enableAnalytics = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        SwitchListTile(
          title: const Text('Enable Notifications'),
          value: _enableNotifications,
          onChanged: (value) {
            setState(() {
              _enableNotifications = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Enable Dark Mode'),
          value: _enableDarkMode,
          onChanged: (value) {
            setState(() {
              _enableDarkMode = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Enable Analytics'),
          value: _enableAnalytics,
          onChanged: (value) {
            setState(() {
              _enableAnalytics = value;
            });
          },
        ),
        const SizedBox(height: 16),
        const Text(
          'Data Usage',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ListTile(
          title: const Text('Download Only on Wi-Fi'),
          subtitle: const Text('Downloads will only occur on Wi-Fi networks.'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // TODO: navigate to Wi-Fi settings page
          },
        ),
        ListTile(
          title: const Text('Clear Cache'),
          subtitle: const Text('Clears all locally stored data and files.'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // TODO: implement cache clearing functionality
          },
        ),
      ],
    );
  }
}
