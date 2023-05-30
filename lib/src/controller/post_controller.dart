import 'package:ai_trade/src/imports.dart';

import '../model/post_card_model.dart';

class PostCardController {
  final PostCardList = [
    PostCardModel(
        name: 'Gold Summary',
        headline: 'Tap to see Gold Summary',
        body: 'Gold price came under heavy bearish pressure and tested \$2,000 before recovering to the \$2,010 area. After the data from the US showed that Nonfarm Payrolls rose by 253,000 in April, much higher than the market consensus of 179,000, the 10-year US T-bond yield surged 2%, causing XAU/USD to turn south.',
        isLiked: true,
        image: 'assets/images/gold.png',
        time: DateTime.now().toString(),
        routeName: '/gold-summary'
    ),
    PostCardModel(
        name: 'Euro Summary',
        headline: 'Tap to see Euro Currency Summary',
        body: 'This is the body of my first post. It contains some interesting information.',
        isLiked: true,
        image: 'assets/images/euro.png',
        time: DateTime.now().toString(),
        routeName: '/euro-summary'
    )
  ];
}
