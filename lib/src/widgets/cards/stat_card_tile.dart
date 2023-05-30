import 'package:ai_trade/src/imports.dart';

class StatsCardTile extends StatelessWidget {
  final DashboardController? data;
  final int? index;
  const StatsCardTile({Key? key, this.index, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {

        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Colors.black45,
                offset: Offset(5.0, 5.0),
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(data!.dashboardList[index!].icon, color: Colors.black, size: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextBuilder(text: data!.dashboardList[index!].value!, fontSize: 17.0, color: Colors.black),
                    TextBuilder(
                      text: data!.dashboardList[index!].title!,
                      textOverflow: TextOverflow.clip,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
