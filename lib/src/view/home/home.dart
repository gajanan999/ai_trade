import 'package:ai_trade/src/controller/post_controller.dart';
import 'package:ai_trade/src/imports.dart';

import '../../widgets/cards/post_card.dart';
import '../../widgets/cards/post_content.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  {
  final pay = PaymentController();
  final dash = DashboardController();
  final post = PostCardController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 1,
        children: List.generate(
          post.PostCardList.length,
          (index) => Card(
            elevation: 4.0,
            child: Center(
              child: PostContent(
                name: post.PostCardList[index].name ?? '',
                image: post.PostCardList[index].image ?? '',
                headingText: post.PostCardList[index].headline ?? '',
                summaryText: post.PostCardList[index].body ?? '',
                routeName: post.PostCardList[index].routeName ?? '',
              ),
            ),
          ),
        ),
      ),
    );
  }
}










// ListView.builder(
        //       padding: EdgeInsets.symmetric(horizontal: 10),
        //       itemCount: post.PostCardList.length,
        //       itemBuilder: (context, index) {
        //         if (index >= 0 && index < post.PostCardList.length) {
        //           return PostCard(
        //             name: post.PostCardList[index].name ?? '',
        //             headline: post.PostCardList[index].headline ?? '',
        //             body: post.PostCardList[index].body ?? '',
        //             image: post.PostCardList[index].image ?? 'https://picsum.photos/200',
        //             isLiked: post.PostCardList[index].isLiked ?? false,
        //             time: post.PostCardList[index].time ?? DateTime.now().toString()
        //           );
        //         } else {
        //           // Return a placeholder widget if the index is out of bounds
        //           return SizedBox.shrink();
        //         }
        //       }),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.white,
        //   onPressed: () {
        //     print('Add button clicked');
        //     //Navigator.push(context, MaterialPageRoute(builder: (_) => CreateInvoiceTemplate()));
        //   },
        //   child: Icon(
        //     Icons.add,
        //     color: Colors.black,
        //
        //   ),
        // ),
