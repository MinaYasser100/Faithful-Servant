import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/Drawer/widgets/drawer_pages_options.dart';
import 'package:flutter/material.dart';

class GeneralDrawer extends StatelessWidget {
  final int privilege;
  const GeneralDrawer({super.key, required this.privilege});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('كيرلس عادل بقطر'),
            accountEmail: Text('kirolosadel34@gmail.com'),
            currentAccountPicture: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/jesus.jpeg'),
            ),
            decoration: BoxDecoration(color: kPrimaryColor),
          ),
          const DrawerPagesOptions(),
          ListTile(
            onTap: () {
              // put log out code here ............
            },
            title: const Text('Log out'),
            trailing: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
