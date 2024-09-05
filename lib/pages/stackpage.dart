import 'package:flutter/material.dart';

class Stackexampla extends StatelessWidget {
  const Stackexampla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Stack",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 200,
                width: 400,
                color: Colors.red,
              ),
              Positioned(
                top: 100,
                left: 40,
                child: Card(
                  elevation: 10,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 45),
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.yellow,
                          ),
                        ),
                        const Text("Hello"),
                        Text("Hello"),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.purple,
                    ),
                    height: 150,
                    width: 300,
                  ),
                ),
              ),
              // Positioned(
              //   top: 40,
              //   left: 20,
              //   child: Container(
              //     height: 100,
              //     width: 200,
              //     color: Colors.yellow,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
