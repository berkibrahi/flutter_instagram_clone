import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram/account/accountreels.dart';
import 'package:instagram/account/grid.dart';
import 'package:instagram/account/useretiket.dart';
import 'package:instagram/profil/profiledit.dart';
import 'package:instagram/profil/resimsec.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({super.key});

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              children: [
                Icon(
                  Icons.lock_outline_rounded,
                ),
                Text(
                  ref.read(profil).degistirlmiskullaniciadiIki == null
                      ? ' '
                      : ref.read(profil).degistirlmiskullaniciadiIki.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  MdiIcons.fromString('chevron-down'),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(
                  'images/iaddblack.png',
                  height: 30,
                  width: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.menu_rounded,
                  size: 35,
                  // color: Colors.black,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Stack(
                      children: [
                        ref.watch(profil).imageFile != null
                            ? CircleAvatar(
                                radius: 45,
                                backgroundImage: FileImage(
                                    File(ref.watch(profil).imageFile!.path)),
                              )
                            : CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                  'images/instagram_avatar.png',
                                ),
                              ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 35, bottom: 10),
                    // height: 60,

                    //  width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Text(
                                  '0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text('Gönderi'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Text(
                                  '474',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text('Takipçi'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Text(
                                  '581',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text('Takip'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.read(profil).degistirlmisIsimIki == null
                            ? ' '
                            : ref.read(profil).degistirlmisIsimIki.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        ref.read(profil).degistirlmisBiyografiIki == null
                            ? ' '
                            : ref
                                .read(profil)
                                .degistirlmisBiyografiIki
                                .toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilEdit(),
                            ));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade300),
                        child: Center(
                          child: Text(
                            'Profili düzenle',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        final snackBar = SnackBar(
                          content: Text('Merhaba, bu bir SnackBar!'),
                          duration: Duration(
                              seconds:
                                  3), // SnackBar'ın ne kadar süre görüntüleneceğini ayarlayabilirsiniz.
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade300),
                        child: Center(
                          child: Text(
                            'Profili paylaş',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.08,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade300),
                      child: Center(
                        child: Icon(
                          MdiIcons.fromString('account-plus'),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                  indicator: null,
                  labelPadding: EdgeInsets.all(8),
                  indicatorColor: Colors.grey,
                  tabs: [
                    Icon(
                      Icons.grid_on_sharp,
                      color: Colors.black,
                    ),
                    Image.asset(
                      'images/reel_32.png',
                      height: 25,
                      width: 25,
                    ),
                    Icon(
                      Icons.account_box_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  ]),
              Expanded(
                child: TabBarView(children: [
                  GridAccount(),
                  AccountReels(),
                  UserEtiket(),
                ]),
              )
            ],
          )),
    );
  }
}
