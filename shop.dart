import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram/homepage.dart';
import 'package:instagram/postshare.dart';
import 'package:instagram/profil/resimsec.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShopPage extends ConsumerStatefulWidget {
  ShopPage({super.key});

  @override
  ConsumerState createState() => _ShopPageState();
}

class _ShopPageState extends ConsumerState<ShopPage> {
  @override
  void initState() {
    super.initState();
    ref.read(profil).getImagesPath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePge(),
                      ));
                },
                icon: Icon(
                  Icons.close,
                  size: 30,
                )),
            title: Text(
              'Yeni gönderi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostShare(),
                        ));
                  },
                  child: Text('İleri'))
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.45,

                  // ignore: unnecessary_null_comparison
                  child: ref.watch(profil).image == null
                      ? Container()
                      : Container(
                          child: Image.file(
                            File(ref.watch(profil).image!),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                );
              },
              childCount: 1, // Liste eleman sayısı
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 60,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    dropdownColor: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    icon: Icon(
                                      MdiIcons.fromString('chevron-down'),
                                      color: Colors.black,
                                    ),
                                    iconSize: 30,
                                    items: ref.read(profil).getItems(),
                                    value: ref.read(profil).selectedModel,
                                    onChanged: (d) {
                                      setState(() {
                                        ref.read(profil).selectedModel = d;
                                      });
                                    })),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade700,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Icon(
                                        MdiIcons.fromString(
                                            'card-multiple-outline'),
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        'BİRDEN FAZLA SEÇ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                child: GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(profil)
                                        .selectImageCamera()
                                        .then((value) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PostShare(),
                                          ));
                                      setState(() {});
                                    });
                                  },
                                  child: Icon(
                                    MdiIcons.fromString('camera-outline'),
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade700),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: 1, // Liste eleman sayısı
            ),
          ),
          SliverGrid.builder(
            itemCount: ref.read(profil).selectedModel?.files?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (_, i) {
              var file = ref.read(profil).selectedModel!.files?[i];

              return ref.read(profil).selectedModel == null ||
                      (ref.read(profil).selectedModel != null &&
                          ref.read(profil).selectedModel!.files!.length < 1)
                  ? Container()
                  : GestureDetector(
                      child: Container(
                        child: Image.file(
                          File(file!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          ref.read(profil).image = file;
                        });
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
