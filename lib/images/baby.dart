import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class BabyImage extends StatelessWidget {
  const BabyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/baby1.png",
      height: 80,
      width: 80,
    );
  }
}

class BabyCryImage extends StatelessWidget {
  const BabyCryImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/babyfall1.png",
      height: 80,
      width: 80,
    );
  }
}
