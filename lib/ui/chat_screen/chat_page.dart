import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: Text('Чат-бот'),
            backgroundColor: AppColor.mainColor,
            foregroundColor: Colors.white),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColor.mainColor, AppColor.mainColorMegaLight])),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemBuilder: (contex, index) {
                  return ListTile(
                    title: Text('Сообщение $index'),
                  );
                },
                itemCount: 20,
              )),
              Container(
                color: AppColor.greyLight,
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(child: TextField()),
                    IconButton(
                        onPressed: () {},
                        icon: ImageIcon(AssetImage('assets/icons/mic.png')))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
