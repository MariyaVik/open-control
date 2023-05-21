import 'package:flutter/material.dart';

import 'size_config.dart';

class ResponseVerticalWidget extends StatelessWidget {
  const ResponseVerticalWidget({super.key, required this.ratio, this.child});
  final Widget? child;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(height: SizeConfig.blockSizeVertical * ratio, child: child);
  }
}

class ResponseHorizontalWidget extends StatelessWidget {
  const ResponseHorizontalWidget({super.key, required this.ratio, this.child});
  final Widget? child;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
        width: SizeConfig.blockSizeHorizontal * ratio, child: child);
  }
}
