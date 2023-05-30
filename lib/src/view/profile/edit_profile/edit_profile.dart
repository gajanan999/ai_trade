import 'package:ai_trade/src/imports.dart';
import 'package:ai_trade/src/model/settings_model.dart';

class ProfileEditPage extends StatefulWidget {

  ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage>{

  bool _loading = false;
  late TextEditingController _oldPasswordController;
  late TextEditingController _nameController;
  late TextEditingController _newPasswordController;
  late TextEditingController _emailIdController;
  late TextEditingController _mobileNrController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;



  @override
  void initState() {
    super.initState();
    // Initialize the text controllers with the current profile data
    _oldPasswordController = TextEditingController();
    _nameController = TextEditingController();
    _newPasswordController = TextEditingController();
    _emailIdController = TextEditingController();
    _mobileNrController = TextEditingController();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _fetchUserProfile();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _nameController.dispose();
    _newPasswordController.dispose();
    _emailIdController.dispose();
    _mobileNrController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();

    super.dispose();
  }

  void _fetchUserProfile() async {
    setState(() {
      _loading = true; // show the progress bar
    });

    try {
      final userProfileModel =
      Provider.of<UserProfileModel>(context, listen: false);
      final userModel= Provider.of<UserModel>(context, listen: false);
      final settings = Provider.of<SettingsModel>(context, listen: false);
     // if(await UserProfileService.fetchUserProfile(userModel, settings, userProfileModel)) {
        _nameController.text= userProfileModel.name;
        _emailIdController.text = userProfileModel.email;
        _oldPasswordController.text = userProfileModel.oldPassword;
        _newPasswordController.text = userProfileModel.newPassword;
        _mobileNrController.text = userProfileModel.mobileNr;
        _startDateController.text = userProfileModel.startDate;
        _endDateController.text = userProfileModel.endDate;

      // }else{
      //   print('Fetching user profile failed');
      // }
      setState(() {
        _loading = false; // hide the progress bar
      });
    } catch (e) {
      setState(() {
        _loading = false; // hide the progress bar
      });
      print(e);
      // handle errors here
    }
  }

  void _saveChanges() async {
    // TODO: Implement saving changes to the profile
    String oldPassword = _oldPasswordController.text;
    String name = _nameController.text;
    String newPassword = _newPasswordController.text;
    String emailId = _emailIdController.text;
    String mobileNr = _mobileNrController.text;

    final userProfileModel =
    Provider.of<UserProfileModel>(context, listen: false);
    final userModel= Provider.of<UserModel>(context, listen: false);
    final settings = Provider.of<SettingsModel>(context, listen: false);
    final result = await UserProfileService.updateUserProfile(userModel, settings, userProfileModel);
    showResultPopup(context, result);
  }

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsModel>(context);
    final userProfileModel =
    Provider.of<UserProfileModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextBuilder(text: 'Edit Profile', color: Colors.black,),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _mobileNrController,
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                        ),
                        enabled: false,
                      ),
                      TextFormField(
                        controller: _startDateController,
                        decoration: InputDecoration(
                          labelText: 'Start Date',
                        ),
                        enabled: false,
                      ),
                      TextFormField(
                        controller: _endDateController,
                        decoration: InputDecoration(
                          labelText: 'End Date',
                        ),
                        enabled: false,
                      ),
                      TextFormField(
                        controller: _oldPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Old Password',
                        ),
                        onChanged: (value) => userProfileModel.setOldPassword(value),
                      ),
                      TextFormField(
                        controller: _newPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'New Password',
                        ),
                        onChanged: (value) => userProfileModel.setNewPassword(value),
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                        onChanged: (value) => userProfileModel.setName(value),
                      ),
                      TextFormField(
                        controller: _emailIdController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email ID',
                        ),
                        onChanged: (value) => userProfileModel.setEmail(value),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _saveChanges,
                  child: Text('update profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showResultPopup(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(''),
        content: Text(message),
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



