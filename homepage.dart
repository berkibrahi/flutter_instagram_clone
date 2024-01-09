import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram/account.dart';
import 'package:instagram/home.dart';
import 'package:instagram/profil/resimsec.dart';
import 'package:instagram/reels.dart';
import 'package:instagram/serach.dart';
import 'package:instagram/shop.dart';

class HomePge extends ConsumerStatefulWidget {
  const HomePge({super.key});

  @override
  ConsumerState<HomePge> createState() => _HomePgeState();
}

class _HomePgeState extends ConsumerState<HomePge> {
  bool circleavatarbir = false;
  int _selectedindex = 0;
  bool _secilenicon = false;
  void _navigatebottombar(int index) {
    setState(() {
      _selectedindex = index;
      _secilenicon = true;
    });
  }

  final List<Widget> _children = [
    UserHome(),
    SearchPage(),
    ShopPage(),
    ReelPage(),
    AccountPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
          // selectedLabelStyle: TextStyle(color: Colors.red, fontSize: 10),

          backgroundColor: _selectedindex == 3 ? Colors.black : Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          iconSize: 35,
          currentIndex: _selectedindex,
          onTap: _navigatebottombar,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: _selectedindex == 0
                  ? Icon(Icons.home_filled)
                  : Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color:
                              _selectedindex == 3 ? Colors.white : Colors.black,
                        ),
                        Positioned(
                          bottom: -5,
                          child: Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined,
                    size: _selectedindex == 1 ? 38 : 35,
                    color: _selectedindex == 3 ? Colors.white : Colors.black),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: _selectedindex == 3 ? Colors.white : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: _selectedindex == 3
                    ? Image.asset('images/reel_32_white.png', height: 30)
                    : Image.asset('images/reel_32.png', height: 30),
                label: ''),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: _selectedindex == 4
                    ? _selectedindex == 3
                        ? Colors.white
                        : Colors.black
                    : _selectedindex == 3
                        ? Colors.black
                        : Colors.white,
                maxRadius: 18,
                child: Stack(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ref.watch(profil).imageFile == null
                              ? Container(
                                  height: 32,
                                  width: 32,
                                  child: Image.asset(
                                    'images/instagram_avatar.png',
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                )
                              : Positioned(
                                  child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: FileImage(
                                      File(ref.watch(profil).imageFile!.path)),
                                )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              label: '',
            ),
          ]),
    );
  }
}
