import 'package:ai_trade/src/imports.dart';
import 'package:ai_trade/src/model/settings_model.dart';


class SettingsPage extends StatefulWidget {

  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _hostNameController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsModel>(context);
    _hostNameController.text = settings.hostname;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  TextBuilder(
          text: 'Settings',
          color: Colors.black,
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Host:Port Address:',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _hostNameController,
              decoration: InputDecoration(
                hintText: 'Enter Host:Port Address',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () => settings.updateHostname(_hostNameController.text),
              child: Text('Update Host Address'),
            ),
          ),
        ],
      ),
    );
  }
}



