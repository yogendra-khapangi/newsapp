import 'package:flutter/material.dart';

class Tabexample extends StatelessWidget {
  const Tabexample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Bar'),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.settings), text: 'Setting'),
            Tab(icon: Icon(Icons.info), text: 'App info'),
          ]),
        ),
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Center(
                child: Image.network(
                    "https://www.cnet.com/a/img/resize/36e8e8fe542ad9af413eb03f3fbd1d0e2322f0b2/hub/2023/02/03/afedd3ee-671d-4189-bf39-4f312248fb27/gettyimages-1042132904.jpg?auto=webp&fit=crop&height=1200&width=1200"),
              ),
              const Center(
                child: Text("setting"),
              ),
              const Center(
                child: Text("app info"),
              ),
            ]),
      ),
    );
  }
}
