import 'package:flutter/material.dart';
import 'package:flutter_sneaker_app/details.dart';
import 'package:flutter_sneaker_app/model/sneaker.dart';

class SneakersHomePage extends StatefulWidget {
  const SneakersHomePage({Key? key}) : super(key: key);

  @override
  State<SneakersHomePage> createState() => _SneakersHomePageState();
}

class _SneakersHomePageState extends State<SneakersHomePage> {
  List<String> brands = ["nike.png", "adidas.png", "reebok.png", "yeezy.png"];
  List<String> chooseBrands = ["All", "Jordan", "Adidas", "Reebok", "Yeezy"];
  String selectedValue = "All";

  // Sneakers list
  List<Sneakers> sneakers = SneakersList;
  var searchSneakers;

  // Now I need to filter sneaker brands two ways one by search TextField and other by dropdownlist. TextField has onChanged property, i can get search characters from there.

  // but i want all the datas even if i don't search anything.
  @override
  void initState() {
    searchSneakers = List.from(sneakers); // grab all data from SneakersList
    super.initState();
  }

  void filterBrands(String value) {
    setState(() {
      // in All option we want all data
      if (value.toLowerCase() == "all") {
        searchSneakers = List.from(sneakers);
      } else {
        // lets create empty list and add filtered datas to it.
        searchSneakers = sneakers.where((sneaker) {
          // i need sneaker name
          final sneakerName = sneaker.name
              .toLowerCase(); // change to lowercase avoid case sensitive issues
          // value that user type on search textfield
          final searchValue = value.toLowerCase();
          // i need to check whether user typed value or char contained in sneakers name list
          return sneakerName.contains(searchValue);
        }).toList();
        print(searchSneakers); // two items which is true.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 241, 226),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sneakersAppBar(),
          Container(
            height: 28,
            padding: const EdgeInsets.only(left: 5),
            decoration: const BoxDecoration(
              color: Colors.amber,
              border: Border(top: BorderSide(width: 2)),
            ),
            alignment: Alignment.center,
            child: const Text(
              "Free Standard Shipping On All Orders # Free Standard Shipping On All Orders #",
              maxLines: 1,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 35,
                    child: TextField(
                      onChanged: (value) =>
                          filterBrands(value), // create method filterBrands
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(3),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 23,
                        ),
                        suffixIcon: Icon(
                          Icons.sync_alt,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Brands",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        height: 45,
                        // color: Colors.yellow,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: brands.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 55,
                              // color: Colors.yellow,
                              margin: const EdgeInsets.only(right: 25),
                              child: Image.asset(
                                "assets/${brands[index]}",
                                fit: BoxFit.contain,
                              ),
                            );
                          }, // create brands image logo
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "All Products",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Colors.indigo,
                        ),
                      ),
                      SizedBox(
                        width: 58,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isDense: true,
                            isExpanded: true,
                            dropdownColor: Color.fromARGB(255, 250, 241, 226),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 15,
                            ),
                            value: selectedValue,
                            items: chooseBrands.map((String brand) {
                              return DropdownMenuItem(
                                value: brand,
                                child: Text(
                                  brand,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: ((String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                                // for dropdown search
                                // lets put selected value in filterBrand method
                                filterBrands(selectedValue);
                              });
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  productDetails(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget productDetails() => Expanded(
        child: ListView.builder(
          itemCount: searchSneakers.length,
          itemBuilder: (context, index) {
            final sneaker = searchSneakers[index];
            return Container(
              height: 250,
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 180,
                    color: sneaker.color,
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/${sneaker.pixelImage}",
                              height: 28,
                              width: 28,
                            ),
                            // If i click turn red or default
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    sneaker.isFavorite = !sneaker.isFavorite;
                                  });
                                },
                                child: sneaker.isFavorite
                                    ? const Icon(Icons.favorite,
                                        color: Colors.red, size: 20)
                                    : const Icon(Icons.favorite_outline,
                                        size: 20)),
                          ],
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to details page
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SneakerDetails(sneaker: sneaker)),
                              );
                            },
                            child: Container(
                              height: 120,
                              width: 190,
                              // color: Colors.white,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      sneaker.nickName.toUpperCase(),
                                      style: const TextStyle(
                                        height: 1,
                                        color: Colors.white,
                                        fontSize: 44,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Image.asset(
                                      "assets/${sneaker.image}",
                                      height: 110,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          sneaker.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.rotationZ(-0.2),
                        child: Container(
                          height: 28,
                          width: 65,
                          color: Colors.indigo,
                          alignment: Alignment.center,
                          child: Text(
                            "\$${sneaker.price}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );

  Widget sneakersAppBar() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
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
            Row(
              children: const [
                Icon(Icons.menu),
                SizedBox(
                  width: 8,
                ),
                Icon(Icons.person_outline),
                SizedBox(
                  width: 8,
                ),
                Icon(Icons.shopping_cart_outlined),
              ],
            ),
          ],
        ),
      );
}
