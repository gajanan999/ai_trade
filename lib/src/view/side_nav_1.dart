import 'package:flutter/material.dart';
import 'package:ai_trade/src/imports.dart';

class DrawerScreen extends StatefulWidget {

  final BuildContext context;
  final Function changeBottomTab;
  DrawerScreen({Key? key,required this.context, required this.changeBottomTab}): super(key: key);

  @override
  DrawerState createState() => DrawerState();
}

class DrawerState extends State<DrawerScreen>  {


 // const DrawerScreen({required this.context, required this.changeBottomTab});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    final settings = Provider.of<SettingsModel>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                  maxRadius: 100.0,
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipOval(
                      child: Image.asset(
                        AITRADE_LOGO,
                        // height: 100.0,
                        // width: 100.0,
                      ),
                    ),
                  )
              ),
              ),
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              //Navigator.pushNamed(context, '/gold-summary');
              widget.changeBottomTab("1");
            },
          ),
          ListTile(
            title: Text('Gold'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => MainView(initRoute: 0,))
              // );

              Navigator.pushNamed(context, '/gold-summary');

            },
          ),
          ListTile(
            title: Text('EURO'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.pushNamed(context, '/euro-summary');
            },
          ),
          ListTile(
            title: Text('Economic Calendar'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.pushNamed(context, '/economic-calendar');
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () async{
              // Attempt to login with the entered credentials
              print(settings.hostname);
              final success = await AuthService.logoutUser(userModel,settings);
              if (success) {
                // If successful, navigate to the home page
                userModel.setToken('');
                userModel.setUser('', '');
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              } else {
                print('Failed');
                // If unsuccessful, display an error message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid username or password'),
                  ),
                );
              }
            },
          ),
          // Add more items to the drawer as needed
        ],
      ),
    );
  }
}
