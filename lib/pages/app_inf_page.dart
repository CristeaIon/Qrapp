import 'package:flutter/material.dart';

import '../widgets/app_info_widget.dart';
import '../widgets/top_bar_image.dart';
import '../widgets/top_bar_text.dart';

class AppInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              TopBarImage(size: size),
              AppBarText(size: size, text: 'App Info'),
              Positioned(
                top: size.height * .06,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          AppInfoWidget(size: size),
        ],
      ),
    );
  }
}
