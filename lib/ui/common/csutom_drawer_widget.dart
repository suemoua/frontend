import 'package:flutter/material.dart';
import 'package:flutter_course/constrant/route_path.dart';


class CustomDrawerWidget extends StatefulWidget {
  const CustomDrawerWidget({Key? key}) : super(key: key);

  @override
  _CustomDrawerWidgetState createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 180,
            color: Theme.of(context).primaryColor,
            child: DrawerHeader(
              child: Column(
                children: [
                  Icon(Icons.shopping_cart, size: 100, color: Colors.white,),
                  Text('Flutter App', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.home);
            },
            leading: Icon(
              Icons.home,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Profile',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {},
            leading: Icon(
              Icons.person,
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            title: Text('My Orders'),
            onTap: () {},
            leading: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {},
            leading: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Setting',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text('Setting'),
            onTap: () {},
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            title: Text('About App'),
            onTap: () {},
            leading: Icon(
              Icons.info,
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            title: Text('Terms and conditions'),
            onTap: () {},
            leading: Icon(
              Icons.policy,
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            title: Text('Privacy and policy'),
            onTap: () {},
            leading: Icon(
              Icons.policy,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}