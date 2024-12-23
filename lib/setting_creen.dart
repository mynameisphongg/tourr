import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LocalizationProvider.dart';


class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    var locale = Provider.of<LocalizationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.translate('settings')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Quản lý thông báo
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text(locale.translate('notification')),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          Divider(),
          // Thay đổi ngôn ngữ
          ListTile(
            leading: Icon(Icons.language),
            title: Text(locale.translate('language')),
            subtitle: Text('${locale.translate('current_language')}: ${locale.languageCode == 'vi' ? 'Tiếng Việt' : 'English'}'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(locale.translate('language')),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text('Tiếng Việt'),
                        onTap: () {
                          Provider.of<LocalizationProvider>(context, listen: false).setLanguage('vi');
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text('English'),
                        onTap: () {
                          Provider.of<LocalizationProvider>(context, listen: false).setLanguage('en');
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Divider(),
          // Quản lý tài khoản
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(locale.translate('account')),
            onTap: () {
              // Điều hướng đến quản lý tài khoản
            },
          ),
          Divider(),
          // Hỗ trợ và liên hệ
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text(locale.translate('support')),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(locale.translate('support')),
                  content: Text('Email: support@tourr.com\nHotline: 1800-123-456'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(locale.translate('close')),
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(),
          // Chính sách bảo mật
          ListTile(
            leading: Icon(Icons.lock_outline),
            title: Text(locale.translate('privacy')),
            onTap: () {
              // Điều hướng đến chính sách bảo mật
            },
          ),
        ],
      ),
    );
  }
}
