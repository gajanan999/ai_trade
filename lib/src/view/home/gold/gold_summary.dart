import 'package:ai_trade/src/imports.dart';
import 'package:ai_trade/src/model/gold_summary_model.dart';
import 'package:ai_trade/src/service/SummaryService.dart';

class GoldSummaryPage extends StatefulWidget {
  GoldSummaryPage({Key? key}) : super(key: key);

  @override
  _GoldSummaryPageState createState() => _GoldSummaryPageState();
}

class _GoldSummaryPageState extends State<GoldSummaryPage> {
  bool _loading = false; // to control the visibility of the progress bar

  @override
  void initState() {
    super.initState();
    _updateGoldSummary();
  }

  Future<void> _updateGoldSummary() async {
    setState(() {
      _loading = true; // show the progress bar
    });

    try {
      final goldSummaryModel =
          Provider.of<GoldSummaryModel>(context, listen: false);
      final userModel = Provider.of<UserModel>(context, listen: false);
      final settings = Provider.of<SettingsModel>(context, listen: false);
      await SummaryService.fetchGoldSummary(
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

  Future<void> _handleRefresh() async {
    await _updateGoldSummary();
  }

  Color getTextColor(String signal){
    if(signal.toLowerCase().contains('buy')){
      return Colors.green;
    }

    if(signal.toLowerCase().contains('sell')){
      return Colors.redAccent;
    }

    return Colors.black54;
  }

  @override
  Widget build(BuildContext context) {
    final goldSummaryModel = Provider.of<GoldSummaryModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextBuilder(
          text: 'Gold Summary',
          color: Colors.black,
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20),
                Center(
                  child: Container(
                    child: CircleAvatar(
                      maxRadius: 100.0,
                      backgroundColor: Colors.transparent,
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: ClipOval(
                          child: Image.asset('assets/images/gold.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _loading // show the progress bar if loading is true
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        child: Text(
                          'Signal: ${goldSummaryModel.signal}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: getTextColor(goldSummaryModel.signal),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        child: Text(
                          'Time: ${goldSummaryModel.time}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        child: Text(
                          'Summary: ${goldSummaryModel.summary}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
