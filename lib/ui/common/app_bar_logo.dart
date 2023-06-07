import 'package:flutter/material.dart';

AppBar appBarLogo(BuildContext context, {List<Widget> actions = const []}) =>
    AppBar(
      // toolbarHeight: 64,
      automaticallyImplyLeading: false,
      title: Image.asset(
        'assets/images/Logotype.png',
        height: 50,
      ),
      actions: actions,
    );
