import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({
    super.key,
    required this.tapname,
    required this.icon,
    required this.OnTap,
  });

  String? tapname;
  Icon? icon;
  VoidCallback? OnTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tapname!),
      leading: icon,
      onTap: OnTap,
    );
  }
}
