import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram/homepage.dart';
import 'package:instagram/postshare/konum%20ara.dart';
import 'package:instagram/profil/resimsec.dart';
import 'package:lottie/lottie.dart';

class PostShare extends ConsumerStatefulWidget {
  const PostShare({
    super.key,
  });

  @override
  ConsumerState<PostShare> createState() => _PostShareState();
}

class _PostShareState extends ConsumerState<PostShare> {
  List muzikekle = [
    ['Mabel M.', 'Antidepresan'],
    ['Edis', 'Martılar'],
    ['Simge', ' Aşkın olayım'],
    ['Serdar Ortaç', 'İlaç'],
    ['Sezen Aksu', 'Tükeneceğiz'],
    ['Athena', 'Senden'],
  ];
  bool switchvaluee = false;
  TextEditingController postaciklama = TextEditingController();
  bool konumGoster = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black, size: 30),
          title: const Text(
            'Yeni gönderi',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    ref.read(profil).degistirlmiskpostAciklama =
                        ref.read(profil).postAciklama.text;
                    ref.read(profil).postPaylas();
                  });
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePge(),
                      )).then((value) {
                    ref.read(profil)..postAciklama.clear();
                    setState(() {});
                  });
                },
                child: Text('Paylaş'))
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 90,
                width: double.infinity,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: Container(
                    width: 60,
                    height: 100,
                    color: Colors.grey,
                    child: Image.file(
                      File(ref.read(profil).image!.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: TextField(
                    controller: ref.read(profil).postAciklama,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Açıklama yaz...',
                      hintStyle: TextStyle(color: Color.fromARGB(64, 0, 0, 0)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const Divider(
                //height: 1,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KonumAra(),
                      ));
                },
                child: Stack(
                  children: [
                    const ListTile(
                      title: Text(
                        'Konum ekle',
                      ),
                    ),
                    Visibility(
                      visible: konumGoster,
                      child: Container(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(
                            ref.read(profil).selectedResult,
                            style: TextStyle(color: Colors.blue),
                          ),
                          trailing: InkWell(
                              onTap: () {
                                setState(() {
                                  konumGoster = false;
                                });
                              },
                              child: Icon(Icons.close)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              const ListTile(
                title: Text('Kişileri etiketle'),
              ),
              const Divider(
                color: Colors.grey,
              ),
              const ListTile(
                title: Text('Hedef kitle'),
                trailing: SizedBox(
                  height: 40,
                  width: 80,
                  child: Row(children: [
                    Text(
                      'Takipçi',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    )
                  ]),
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              const ListTile(
                title: Text('Muzik ekle'),
              ),
              const Divider(
                height: 5,
                color: Colors.grey,
              ),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: muzikekle.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Lottie.asset(
                                    'images/animation_lm92duyq.json',
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    muzikekle[index][0].toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 5,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    muzikekle[index][1].toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )),
              const Divider(
                height: 2,
                color: Colors.grey,
              ),
              const ListTile(
                title: Text('Ayrıca şurada paylaş:'),
              ),
              ListTile(
                title: Text('Facebook uygulamasında paylaş'),
                trailing: Switch(
                    value: switchvaluee,
                    onChanged: (value) {
                      setState(() {
                        switchvaluee = value;
                      });
                    }),
              ),
              const ListTile(
                title: Text('Gelişmiş ayarlar'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
            ],
          ),
        ));
  }
}
