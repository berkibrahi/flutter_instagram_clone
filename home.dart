import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram/profil/resimsec.dart';
import 'package:instagram/util/Favoriler.dart';
import 'package:instagram/util/bubblestory.dart';
import 'package:instagram/util/commentpage.dart';
import 'package:instagram/util/degiskenler.dart';
import 'package:instagram/util/takipettiklerin.dart';
import 'package:instagram/util/userpost.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:vs_story_designer/vs_story_designer.dart';

class UserHome extends ConsumerStatefulWidget {
  @override
  ConsumerState<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends ConsumerState<UserHome> {
  final homeriverpod = ChangeNotifierProvider((ref) => Degiskenler());
  bool instagrambari = false;
  @override
  void initState() {
    ref.read(homeriverpod).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final uygulahomeriverpod = ref.watch<Degiskenler>(homeriverpod);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                // automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,

                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              instagrambari = !instagrambari;
                            });
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'images/insta_1.png',
                                width: 120,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Visibility(
                                  visible: instagrambari,
                                  child: Icon(
                                    MdiIcons.fromString('chevron-down'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(
                                Icons.favorite_border,
                                size: 30,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child: Positioned(
                                bottom: -7,
                                child: Icon(
                                  MdiIcons.fromString('camera-account'),
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                MdiIcons.fromString('facebook-messenger'),
                              ),
                              iconSize: 30,
                            ),
                            Positioned(
                              left: 25,
                              bottom: 25,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.redAccent.shade400),
                                child: const Text(
                                  '4',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          height: 130,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: uygulahomeriverpod.item.length,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          _createRouteLeft(),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Stack(
                                            clipBehavior: Clip.none,
                                            alignment: Alignment.center,
                                            children: [
                                              Stack(
                                                children: [
                                                  ref.watch(profil).imageFile ==
                                                          null
                                                      ? Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5,
                                                                  left: 12),
                                                          child: CircleAvatar(
                                                            radius: 30,
                                                            backgroundColor:
                                                                Colors.white,
                                                            backgroundImage:
                                                                AssetImage(
                                                              'images/instagram_avatar.png',
                                                            ),
                                                          ),
                                                        )
                                                      : Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5,
                                                                  left: 12),
                                                          child: CircleAvatar(
                                                            radius: 30,
                                                            backgroundImage:
                                                                FileImage(File(ref
                                                                    .watch(
                                                                        profil)
                                                                    .imageFile!
                                                                    .path)),
                                                          ),
                                                        )
                                                ],
                                              ),
                                              Positioned(
                                                top: 43,
                                                left: 45,
                                                child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 45,
                                                left: 48,
                                                child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.blue,
                                                  ),
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 12),
                                            child: const Text('Hikayen'),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                return BubleStory(
                                  text: uygulahomeriverpod
                                          .item[index].firstName ??
                                      ' bos',
                                  avataradres: uygulahomeriverpod
                                      .item[index].avatar
                                      .toString(),
                                );
                              }),
                        ),
                        Visibility(
                          visible: instagrambari,
                          child: Positioned(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          _createRouteTakipedilen(),
                                        );
                                      },
                                      child: Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Takip ettiklerin',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(
                                              MdiIcons.fromString(
                                                'account-supervisor-outline',
                                              ),
                                              size: 30,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          _createRouteFavoriler(),
                                        );
                                      },
                                      child: Expanded(
                                        flex: 1,
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Favoriler',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Icon(
                                              Icons.star_border_outlined,
                                              size: 30,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              margin: const EdgeInsets.only(left: 20),
                              width: 200,
                              height: 80,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      offset: const Offset(10, 10),
                                      blurRadius: 15,
                                      spreadRadius: -10),
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      offset: const Offset(-10, -10),
                                      blurRadius: 15,
                                      spreadRadius: -10),
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      offset: const Offset(-10, 10),
                                      blurRadius: 15,
                                      spreadRadius: -10),
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      offset: const Offset(10, -10),
                                      blurRadius: 15,
                                      spreadRadius: -10),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  childCount: 1, // Liste eleman sayısı
                ),
              ),
              Container(
                child: SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: uygulahomeriverpod.item.length,
                      (context, index) {
                    return UserPost(
                      name: uygulahomeriverpod.item[index].lastName.toString(),
                      postadres:
                          uygulahomeriverpod.item[index].avatar.toString(),
                    );
                  }),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Route _createRouteLeft() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CommentPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-5.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRouteFavoriler() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Favoriler(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(5.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRouteTakipedilen() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const TakipEtiklerin(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(5.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
