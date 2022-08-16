import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_sneaker_app/model/sneaker.dart';

class SneakerDetails extends StatefulWidget {
  final Sneakers sneaker;
  const SneakerDetails({Key? key, required this.sneaker}) : super(key: key);

  @override
  State<SneakerDetails> createState() => _SneakerDetailsState();
}

class _SneakerDetailsState extends State<SneakerDetails>
    with SingleTickerProviderStateMixin {
  // 360 degree rotation animation to sneaker image
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();
  late final Animation _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.5, curve: Curves.linear)));

  // sneaker sizes
  List<int> sneakerSizes = [for (var i = 3; i <= 20; i++) i];
  int selectedSize = 15;

  // sneaker quantity
  List<int> sneakerQuantities = [for (var i = 1; i <= 10; i++) i];
  int selectedQuantity = 1;

  // dispose animation controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 241, 226),
      body: Column(
        children: [
          detailsAppBar(),
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: widget.sneaker.color,
              border: const Border(top: BorderSide(width: 2)),
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 150,
                    width: 250,
                    // color: Colors.white,
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            widget.sneaker.nickName.toUpperCase(),
                            style: TextStyle(
                              height: 1,
                              color: Colors.black.withOpacity(0.06),
                              fontSize: 63,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return Transform(
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.003)
                                    ..rotateY(2 * pi * _animation.value),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/${widget.sneaker.image}",
                                    height: 150,
                                    width: 250,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Container(
                      height: 25,
                      width: 300,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.yellowAccent,
                      ),
                      child: const Text(
                        "Free Shipping @ Free Shipping @ Free Shipping @ Free Shipping @ Free Shipping @ ",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Image.asset(
                    "assets/${widget.sneaker.iconImage}",
                    height: 20,
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          sneakerDetails(),
        ],
      ),
    );
  }

  Widget sneakerDetails() => Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    widget.sneaker.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      height: 1,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Row(
                    children: [
                      // rationg bar
                      RatingBar.builder(
                          itemCount: 5,
                          itemSize: 15,
                          allowHalfRating: true,
                          initialRating: widget.sneaker.rating,
                          onRatingUpdate: (rating) {
                            setState(() {
                              widget.sneaker.rating = rating;
                            });
                          },
                          itemBuilder: (context, _) {
                            return const Icon(Icons.star, color: Colors.amber);
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.sneaker.rating.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Ratings",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: widget.sneaker.color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                  border: Border(
                top: BorderSide(width: 1.5, color: Colors.grey),
                bottom: BorderSide(width: 1.5, color: Colors.grey),
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Price: ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Text(
                        "\$${widget.sneaker.price}",
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.red,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  sneakerSize(),
                  sneakerQuantity(),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Product Description:",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Icon(Icons.arrow_upward, size: 18),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          "Sneakers are shoes primarily designed for sports or other forms of physical exercise, but which are now also widely used for everydary casual wear, Contemporary sneakers are largely made from synthetic materials.",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 247, 6, 2),
                        ),
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 16,
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

  Widget sneakerQuantity() => Row(
        children: [
          Text(
            "Quantity: ",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 30,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isDense: true,
                isExpanded: true,
                dropdownColor: Color.fromARGB(255, 250, 241, 226),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 15,
                ),
                value: selectedQuantity,
                items: sneakerQuantities.map((int brand) {
                  return DropdownMenuItem(
                    value: brand,
                    child: Text(
                      brand.toString(),
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: ((int? newValue) {
                  setState(() {
                    selectedQuantity = newValue!;
                  });
                }),
              ),
            ),
          ),
        ],
      );

  Widget sneakerSize() => Row(
        children: [
          Text(
            "Select Size: ",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 30,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isDense: true,
                isExpanded: true,
                dropdownColor: Color.fromARGB(255, 250, 241, 226),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 15,
                ),
                value: selectedSize,
                items: sneakerSizes.map((int brand) {
                  return DropdownMenuItem(
                    value: brand,
                    child: Text(
                      brand.toString(),
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: ((int? newValue) {
                  setState(() {
                    selectedSize = newValue!;
                  });
                }),
              ),
            ),
          ),
        ],
      );

  Widget detailsAppBar() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                // back to home
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
            Row(
              children: [
                // favorite turn red
                GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.sneaker.isFavorite = !widget.sneaker.isFavorite;
                      });
                    },
                    child: widget.sneaker.isFavorite
                        ? const Icon(Icons.favorite,
                            color: Colors.red, size: 20)
                        : const Icon(Icons.favorite_outline, size: 20)),
                const SizedBox(
                  width: 8,
                ),
                const Icon(Icons.share),
                const SizedBox(
                  width: 8,
                ),
                const Icon(Icons.shopping_cart_outlined),
              ],
            ),
          ],
        ),
      );
}
