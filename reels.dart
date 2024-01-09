import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram/util/degiskenler.dart';
import 'package:instagram/util/reelspost.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ReelPage extends ConsumerStatefulWidget {
  const ReelPage({super.key});

  @override
  ConsumerState<ReelPage> createState() => _ReelPageState();
}

class _ReelPageState extends ConsumerState<ReelPage> {
  final reelriverpod = ChangeNotifierProvider((ref) => Degiskenler());
  @override
  void initState() {
    ref.read(reelriverpod).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final uygulareelriverpod = ref.watch(reelriverpod);
    return Scaffold(
        body: Stack(
      children: [
        PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: uygulareelriverpod.item.length,
            itemBuilder: (context, index) {
              return ReelsPost(
                namereels: uygulareelriverpod.item[index].firstName.toString(),
                reelsavatar: uygulareelriverpod.item[index].avatar.toString(),
              );
            }),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Reels',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Icon(MdiIcons.fromString('chevron-down'),
                        color: Colors.white),
                  ],
                ),
                Row(
                  children: [
                    Icon(MdiIcons.fromString('camera-outline'),
                        size: 35, color: Colors.white),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
