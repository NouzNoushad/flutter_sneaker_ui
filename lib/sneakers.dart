import 'package:flutter/material.dart';
import 'package:flutter_sneaker_app/sneakers_home.dart';

class SneakersIntro extends StatefulWidget {
  const SneakersIntro({Key? key}) : super(key: key);

  @override
  State<SneakersIntro> createState() => _SneakersIntroState();
}

class _SneakersIntroState extends State<SneakersIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 241, 226),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Stack(
              children: [
                const Text(
                  "Sneaker",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Transform(
                    transform: Matrix4.rotationZ(-0.2),
                    child: Container(
                      height: 18,
                      width: 42,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigo,
                            offset: Offset(-2, 2),
                          ),
                        ],
                      ),
                      child: const Text(
                        "bumb",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 340,
            width: MediaQuery.of(context).size.width,
            // color: Colors.yellow,
            child: Stack(
              children: [
                // red background banner ad
                Positioned(
                  bottom: 40,
                  left: -20,
                  child: Transform(
                    transform: Matrix4.rotationZ(-0.6),
                    child: Container(
                      height: 28,
                      width: 500,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: const Text(
                        "Dream Chasers Wear Sneakers # ream Chasers Wear Sneakers # ream Chasers Wear Sneakers #",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                // blue background banner ad
                Positioned(
                  top: 80,
                  left: -20,
                  child: Transform(
                    transform: Matrix4.rotationZ(0.4),
                    child: Container(
                      height: 28,
                      width: 500,
                      color: Colors.blueAccent.shade700,
                      alignment: Alignment.center,
                      child: const Text(
                        "Dream Chasers Wear Sneakers # ream Chasers Wear Sneakers # ream Chasers Wear Sneakers #",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Image.asset(
                    "assets/intro_shoe.png",
                    height: 280,
                    width: 350,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 30,
                  child: Image.asset(
                    "assets/mini4.png",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 30,
                  child: Image.asset(
                    "assets/mini2.png",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 60,
                  right: 80,
                  child: Image.asset(
                    "assets/mini3.png",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 80,
                  right: 20,
                  child: Image.asset(
                    "assets/mini1.png",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 25),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 80,
                        width: double.infinity,
                        // color: Colors.yellow,
                        child: Stack(
                          children: [
                            Text(
                              "Shoes Are Boring Wear".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 85,
                              child: Transform(
                                transform: Matrix4.rotationZ(-0.08),
                                child: Container(
                                  height: 38,
                                  width: 170,
                                  color: Colors.amber,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "sneakers".toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'The little voice in your head that says "buy the sneakers" that the one to list to.',
                        style: TextStyle(
                          fontSize: 12.2,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to Sneakers home page
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SneakersHomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 247, 6, 2),
                          ),
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
