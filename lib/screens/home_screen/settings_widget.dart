import 'package:flutter/material.dart';
import 'package:riddle_leader/controllers/user_data_controller.dart';
import 'package:get/get.dart';
import 'package:riddle_leader/screens/about_screen.dart';

class SettingsWidget extends StatefulWidget {
  SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  bool _enableNotifications = true;
  bool _enableDarkMode = false;
  bool _enableAnalytics = true;
  final dataController = Get.find<UserDataController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'General Settings',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'changeLanguage'.tr,
                style: const TextStyle(fontSize: 17, color: Colors.white),
              ),
              LanguageChangeButton(dataController: dataController),
            ],
          ),
        ),
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
          title: const Text('Game Play Music'),
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
          title: const Text('Clear Cache'),
          subtitle: const Text('Clears all locally stored data and files.'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Delete my account'),
          subtitle: const Text('All data will be removed permanently'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('About'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Get.to(() => AboutScreen());
          },
        ),
      ],
    );
  }
}

class LanguageChangeButton extends StatelessWidget {
  const LanguageChangeButton({
    super.key,
    required this.dataController,
  });

  final UserDataController dataController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (() {
        if (dataController.isLanChoosen.value) {
          Get.updateLocale(Locale('en', 'EN'));
          dataController.updateLanguage(false);
        } else {
          Get.updateLocale(Locale('uz', 'UZ'));
          dataController.updateLanguage(true);
        }
      }),
      child: Row(
        children: [
          Text(
            dataController.isLanChoosen.value ? "Uzbek" : "English",
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 101, 231, 235),
            ),
          ),
          const SizedBox(),
          const Icon(
            Icons.language,
            size: 22.0,
            color: Color.fromARGB(255, 101, 231, 235),
          ),
        ],
      ),
    );
  }
}
