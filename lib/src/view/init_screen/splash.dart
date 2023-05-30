import 'dart:ui';

import 'package:ai_trade/src/imports.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          // MaterialPageRoute(
          //     builder: (context) => MainView(
          //       initRoute: 0,
          //     )),
          MaterialPageRoute(
              builder: (context) => StartingPage()),
              (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
            Center(
              child: Image.asset(
                  LAUNCHER_AI_IMAGE
            ),
          ),
        ]
      ),
    );
  }
}

class StartingPage extends StatelessWidget {
  TextEditingController _hostNameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {

    final settings = Provider.of<SettingsModel>(context);
    _hostNameController.text = settings.hostname;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            LAUNCHER_AI_IMAGE,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to AITrade',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50.0),
              Text(
                'We provide a market analysis using ML & AI',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50.0),
              SizedBox(
                width: 150.0,
                height: 30.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text('Login'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: 150.0,
                height: 30.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text('Sign Up'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Host Address',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _hostNameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter Host:port Address',
                    border: OutlineInputBorder(),
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide:  BorderSide(color: Colors.white ),

                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: 200.0,
                height: 30.0,
                child: ElevatedButton(
                  onPressed: () {
                    settings.updateHostname(_hostNameController.text);
                  },
                  child: Text('Update Host Address'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
