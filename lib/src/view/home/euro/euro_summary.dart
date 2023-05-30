import 'package:ai_trade/src/imports.dart';
import 'package:ai_trade/src/model/gold_summary_model.dart';
import 'package:ai_trade/src/service/SummaryService.dart';

class EuroSummaryPage extends StatefulWidget {
  EuroSummaryPage({Key? key}) : super(key: key);

  @override
  _EuroSummaryPageState createState() => _EuroSummaryPageState();
}

class _EuroSummaryPageState extends State<EuroSummaryPage> {
  bool _loading = false; // to control the visibility of the progress bar

  @override
  void initState() {
    super.initState();
    _updateGoldSummary();
  }

  void _updateGoldSummary() async {
    setState(() {
      _loading = true; // show the progress bar
    });

    try {
      final goldSummaryModel =
      Provider.of<GoldSummaryModel>(context, listen: false);
      final userModel = Provider.of<UserModel>(context, listen: false);
      final settings = Provider.of<SettingsModel>(context, listen: false);
      await SummaryService.fetchEuroSummary(
          userModel, settings, goldSummaryModel);
      setState(() {
        _loading = false; // hide the progress bar
      });
    } catch (e) {
      setState(() {
        _loading = false; // hide the progress bar
      });
      // handle errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    final goldSummaryModel = Provider.of<GoldSummaryModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  TextBuilder(
          text: 'Euro Summary',
          color: Colors.black,
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Container(
                child: CircleAvatar(
                    maxRadius: 100.0,
                    backgroundColor: Colors.transparent,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipOval(
                        child: Image.asset('assets/images/euro.png'),
                      ),
                    )
                ),
              ),
            ),
            Center(
              child: Container(child:_loading // show the progress bar if loading is true
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : goldSummaryModel.summary ==
                    null // show a message if there is no data yet
                    ? Center(
                  child: Text(
                      'No data yet',
                      style: TextStyle(fontSize: 25)
                  ),
                )
                    : Center(
                  child: Text(
                      goldSummaryModel.summary,
                      style: TextStyle(fontSize: 25)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
