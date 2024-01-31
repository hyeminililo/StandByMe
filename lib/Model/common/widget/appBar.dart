import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 자유게시판, 1:1 채팅에 사용할 기본적인 AppBar

class AppBarBase extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBase({super.key, required this.title, this.center = false});

  final String title;
  final bool center;

  @override //appBar를 만들때stf이 맞는 건지 stless가 맞는건지 더더욱 모르겠다
  Widget build(BuildContext context) {
    return AppBarWithSearchSwitch(
        onChanged: (text) {},
        appBarBuilder: (context) {
          return AppBar(
            title: const Text('STAND BY ME'),
            actions: [
              const AppBarSearchButton(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.alarm)),
              IconButton(onPressed: ()=>context.go('/profile'), icon: const Icon(Icons.person))
            ],
          );
        },
        fieldHintText: 'Search');
  }

  @override
  // TODO: implement preferredSize //APP BAR  size
  Size get preferredSize => const Size.fromHeight(70);
}
