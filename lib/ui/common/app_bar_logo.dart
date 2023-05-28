import 'package:flutter/material.dart';

AppBar appBarLogo(BuildContext context, {List<Widget> actions = const []}) =>
    AppBar(
      automaticallyImplyLeading: false,
      title: Image.asset(
        'assets/images/Logotype.png',
      ),
      actions: actions,
    );
