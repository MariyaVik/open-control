import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../common/size_config.dart';
import '../theme/app_color.dart';
import 'widgets/panel.dart';
import 'widgets/select_entities.dart';
import 'widgets/user_kons.dart';

class KonsMainView extends StatefulWidget {
  const KonsMainView({super.key});

  @override
  State<KonsMainView> createState() => _KonsMainViewState();
}

class _KonsMainViewState extends State<KonsMainView> {
  late double filterHight;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig().init(context);
    filterHight = SizeConfig.screenHeight * 0.2;
  }

  @override
  Widget build(BuildContext context) {
    final maxH = MediaQuery.of(context).size.height * 0.7;
    final minH = MediaQuery.of(context).size.height * 0.2;
    return Stack(
      children: [
        SlidingUpPanel(
          maxHeight: maxH,
          minHeight: minH,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          color: AppColor.greyMegaLight,
          // parallaxEnabled: true,
          // parallaxOffset: 0.5,
          body: UserKons(),
          panelBuilder: (sc) => PanelWidget(sc: sc),
          onPanelSlide: (position) {
            final hightKoef = maxH - minH;
            filterHight = position * hightKoef + minH;
            // setState(() {});
          },
        ),
        // Positioned(bottom: filterHight, child: SelectEntityWidget()),
      ],
    );
  }
}