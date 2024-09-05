import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/pages/stackpage.dart';
import 'package:newsapp/pages/tabex.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _fetchdata() async {
    print("❤️❤️❤️❤️❤️");
    //fetch data from server
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=b2365762128740ea8ab876bedfcb256e');
    var response = await http.get(url);
    print(response.body.toString());

    return jsonDecode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            "Top News",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("Abhishek Mishra"),
                accountEmail: Text("abhishekm977@gmail.com"),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(
                      Icons.supervised_user_circle_outlined,
                      size: 40,
                    )),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("setting"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Stackexampla()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Tabexamplepage"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Tabexample()));
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                  future: _fetchdata(),
                  builder: (context, AsyncSnapshot snapshort) {
                    if (snapshort.hasData) {
                      return Column(
                        children: [
                          ...snapshort.data['articles'].map((e) => Card(
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.network(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyNDdRGlXY5SvYbNioRJtjYGZz17FbkU-hPA&s",
                                            height: 50,
                                            width: 200,
                                          ),
                                          // Text(e["urlToImage"].toString()),
                                          Text(
                                            e["title"].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            e["author"].toString(),
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        top: 2,
                                        right: 4,
                                        child: GestureDetector(
                                            // onTap: () async {
                                            //   debugPrint("pressed");
                                            //  Share.shareUri(uri: );
                                            // },
                                            onTap: () async {
                                              var url = Uri.parse(
                                                  "www.codeit.com.np");
                                              await Share.shareUri(url);
                                            },
                                            child: const Icon(Icons.share)))
                                  ],
                                ),
                              ))
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
            ],
          ),
        ));
  }
}
