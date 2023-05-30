import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/user-model.dart';
import 'package:ai_trade/src/imports.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Add a form key

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    final settings = Provider.of<SettingsModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      hintText: 'Enter your Mobile Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a mobile number';
                      }
                      // Add any other validation rules as needed
                      return null; // Return null if the value is valid
                    },
                    onChanged: (value) => userModel.mobileNumber = value,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      // Add any other validation rules as needed
                      return null; // Return null if the value is valid
                    },
                    onChanged: (value) => userModel.password = value,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Attempt to login with the entered credentials
                        print(settings.hostname);
                        final success =
                        await AuthService.loginUser(userModel, settings);
                        if (success) {
                          // If successful, navigate to the home page
                          Navigator.pushNamed(context, '/home1');
                        } else {
                          print('Failed');
                          // If unsuccessful, display an error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Invalid username or password'),
                            ),
                          );
                        }
                      }
                    },
                    child: Text('Log In'),
                  ),
                  SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      showLoginForgetPasswordPopup(
                          context, UserMessages.CONTACT_ADMINISTRATOR);
                    },
                    child: Text('Forgot Password?'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showLoginForgetPasswordPopup(BuildContext context, String errorMessage) {
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
