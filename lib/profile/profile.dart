import 'package:flutter/material.dart';
import 'package:filipino_cuisinero/utils/auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  String? email = AuthUser().user?.email;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.none,
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(color: Colors.grey.shade300),
            ),
            Positioned(
              top: 135,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        minRadius: 60.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "firstname lastname",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Noto',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    email!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Noto',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 160,
        ),
        Container(
          padding: const EdgeInsets.only(left: 14),
          child: Wrap(
            runSpacing: 10,
            children: <Widget>[
              ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.account_circle, color: Colors.black54),
                  title: Text('Account Settings',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 18))),
              ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings, color: Colors.black54),
                  title: Text('Application Settings',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 18))),
              ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.info, color: Colors.black54),
                  title: Text('About',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 18))),
              ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.help, color: Colors.black54),
                  title: Text('Help',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 18))),
              ListTile(
                  onTap: () {
                    AuthUser().logout();
                  },
                  leading: const Icon(Icons.logout, color: Colors.black54),
                  title: Text('Log Out',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 18))),
            ],
          ),
        )
      ],
    );
  }
}
