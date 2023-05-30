import 'package:ai_trade/src/imports.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "AI Trade";

  bool _userProfileFetched = false;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _fetchUserProfile() async {
    try {
      final userProfileModel =
      Provider.of<UserProfileModel>(context, listen: false);
      final userModel= Provider.of<UserModel>(context, listen: false);
      final settings = Provider.of<SettingsModel>(context, listen: false);
      if(await UserProfileService.fetchUserProfile(userModel, settings, userProfileModel)) {
        setState(() {
          print(userProfileModel.name);
          username = userProfileModel.name ?? "AI Trade";
          _userProfileFetched = true; // show the progress bar
        });
      }else{
        print('Fetching user profile failed');
        setState(() {
          _userProfileFetched = false; // show the progress bar
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        _userProfileFetched = false; // hide the progress bar
      });
      // handle errors here
    }
  }

  String getUserName(){
    if(_userProfileFetched){
      return username.substring(0, 1).toUpperCase();
    }else{
      return "AI";
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child:  Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      child: Text(
                        this.getUserName(),
                        style: TextStyle(fontSize: 24.0),
                      ),
                      radius: 40.0,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      username,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Personal Information'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        if(_userProfileFetched){
                          // Navigate to personal information page
                          Navigator.pushNamed(context, '/edit-profile');
                        }else{
                          showUserProfileFetchedErrorPopup(context, 'Error while getting User Profile');
                        }
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to settings page
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                        Navigator.pushNamed(context, '/settings');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.security),
                      title: Text('Privacy and Security'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to privacy and security page
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



void showUserProfileFetchedErrorPopup(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: Text(errorMessage),
        actions: [
          ElevatedButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
