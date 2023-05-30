import 'package:ai_trade/src/imports.dart';
import 'package:ai_trade/src/view/side_nav_1.dart';

class MainView extends StatefulWidget {
  final String initRoute;

  const MainView({Key? key, required this.initRoute}) : super(key: key);
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  String _currentIndex = "0";
  late UserModel userModel;

  Map<String, StatefulWidget> tabs = {"0": Home(), "1":Profile()};
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initRoute;
    //userModel = Provider.of<UserModel>(context);
  }

  void _changeBottomTab(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: TextBuilder(
          text: 'AI Trade',
          color: Colors.black,
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer:  Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white, //This will change the drawer background to orange.
          //other styles
        ),
        child: DrawerScreen(context: context, changeBottomTab: _changeBottomTab),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        onTap: (index) {
          setState(() {
            _currentIndex = index.toString();
          });
        },
        currentIndex: int.parse(_currentIndex),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
