import 'package:ai_trade/src/imports.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    final settings = Provider.of<SettingsModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 80.0),
                CircleAvatar(
                    maxRadius: 100.0,
                    backgroundColor: Colors.transparent,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipOval(
                        child: Image.asset(
                          AITRADE_LOGO,
                          // height: 100.0,
                          // width: 100.0,
                        ),
                      ),
                    )
                ),
                SizedBox(height: 40.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter Your Name',
                    border:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) => userModel.username = value,
                ),
                SizedBox(height: 20.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) => userModel.password = value,
                ),
                SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) => userModel.email = value,
                ),
                SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Mobile',
                    hintText: 'Enter your Mobile Number',
                    border:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) => userModel.mobileNumber = value,
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  //width: 150.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () async{
                      //Navigator.pushNamed(context, '/signup');
                      final result = await AuthService.registerUser(userModel, settings);
                      if(result == 'SUCCESS'){
                        Navigator.pushNamed(context, '/login');
                      }else{
                        showSignUpResultPopup(context, result);
                      }
                    },
                    child: Text('Sign Up'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


void showSignUpResultPopup(BuildContext context, String errorMessage) {
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
