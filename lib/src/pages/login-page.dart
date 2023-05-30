import 'package:ai_trade/src/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/user-model.dart';
import '../constants/constant.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                LOGIN_HEADER,
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: LOGIN_USERNAME_LABEL,
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => userModel.username = value,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: LOGIN_PASSWORD_LABEL,
                ),
                obscureText: true,
                onChanged: (value) => userModel.password = value,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async{
                // // Attempt to login with the entered credentials
                // bool success = await userModel.loginUser();
                // if (success) {
                //   // If successful, navigate to the home page
                //   Navigator.pushReplacementNamed(context, '/home');
                // } else {
                //   print('Failed');
                //   // If unsuccessful, display an error message
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //       content: Text('Invalid username or password'),
                //     ),
                //   );
                // }
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size.fromWidth(100)),
              ),
              child: const Text(LOGIN_BUTTON),
            ),
            const SizedBox(height: 20),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/register');
            //   },
            //   child: const Text(REGISTER_BUTTON),
            // ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}