import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              title: Column(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      margin: EdgeInsets.all(10),
                      height: 50,
                      child: TextField(
                        showCursor: true,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            hoverColor: Colors.amber,
                            focusColor: Colors.grey,
                            focusedBorder: InputBorder.none,
                            hintText: 'Ara',
                            contentPadding: EdgeInsets.all(5),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                )),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                )),
                            fillColor: Colors.grey.shade300,
                            filled: true),
                      ),
                    ),
                  ),
                ],
              ),
              //  collapsedHeight: 60,
              // floating: true,
              backgroundColor: Colors.white,
              stretch: true,
              onStretchTrigger: () async {},
              stretchTriggerOffset: 80,
              expandedHeight: 60,
              flexibleSpace: Center(
                child: FlexibleSpaceBar(
                  title: Padding(
                    padding: const EdgeInsets.only(right: 50, top: 100),
                    child: SpinKitRing(
                      lineWidth: 2.8,
                      color: Colors.grey,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            ),
            SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Container(
                      color: Colors.deepPurple.shade100,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
