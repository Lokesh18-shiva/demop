import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyImage {
  final String imagePath;
  final String price;
  final String name;

  MyImage({
    required this.imagePath,
    required this.price,
    required this.name,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  List karthick = [
    "asset/image/image1.png",
    "asset/image/Image2.png",
    "asset/image/Image3.png",
    "asset/image/Image4.png",
    "asset/image/Image3.png",
    "asset/image/Image2.png",
  ];
  List aryan = [
    "asset/image/image6.png",
    "asset/image/image6.png",
    "asset/image/image6.png",
    "asset/image/image6.png",
    "asset/image/image6.png",
    "asset/image/image6.png",
  ];

  List textList = [
    "What's New",
    "What's New",
    "What's New",
    "What's New",
    "What's New",
    "What's New",
    "What's New",
  ];

  final List<String> slider = [
    ('asset/image/image5.png'),
    ('asset/image/image5.png'),
    ('asset/image/image5.png'),
    ('asset/image/image5.png'),
    // Add more image URLs as needed
  ];

  final List<MyImage> imageList2 = [
    MyImage(
      imagePath: "asset/image/Food Image.png",
      price: "\$60",
      name: "Chocolate pie",
    ),
    MyImage(
        imagePath: "asset/image/Food Image.png",
        price: "\$30",
        name: "Chocolate pie"),
    MyImage(
        imagePath: "asset/image/Food Image.png",
        price: "\$100",
        name: "Chocolate pie"),
    MyImage(
        imagePath: "asset/image/Food Image.png",
        price: "\$129",
        name: "Chocolate pie"),
  ];

  final List<MyImage> imageList3 = [
    MyImage(
      imagePath: "asset/image/Image.png",
      price: "\$60",
      name: "Chocolate pie",
    ),
    MyImage(
        imagePath: "asset/image/Image.png",
        price: "\$30",
        name: "Chocolate pie"),
    MyImage(
        imagePath: "asset/image/Image.png",
        price: "\$100",
        name: "Chocolate pie"),
    MyImage(
        imagePath: "asset/image/Image.png",
        price: "\$129",
        name: "Chocolate pie"),
    MyImage(
        imagePath: "asset/image/Image.png",
        price: "\$129",
        name: "Chocolate pie"),
    MyImage(
        imagePath: "asset/image/Image.png",
        price: "\$129",
        name: "Chocolate pie"),
    MyImage(
        imagePath: "asset/image/Image.png",
        price: "\$129",
        name: "Chocolate pie"),
    MyImage(
        imagePath: "asset/image/Image.png",
        price: "\$129",
        name: "Chocolate pie"),
    MyImage(
        imagePath: "asset/image/Image.png",
        price: "\$129",
        name: "Chocolate pie"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("asset/image/image1.png"),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 150, // Specify a fixed height for the container
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: karthick.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            Container(
                              height: 90,
                              width: 80,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xffFEDA75),
                                      Color(0xffFA7E1E),
                                      Color(0xffD62976),
                                      Color(0xff962FBF),
                                      Color(0xff4F5BD5)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.centerRight),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Image.asset(karthick[index],
                                        width: double.infinity),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(textList[index]),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "In the Spotlight",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider(
                items: slider.map((photos) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          fit: BoxFit.cover,
                          width: double.infinity,
                          photos,
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  disableCenter: true,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  height: 200,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, _) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: slider.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.grey
                                : Colors.red)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Explore",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2, // Set the number of columns here
              children: List.generate(imageList2.length, (index) {
                return Image.asset(
                  height: 200,
                  width: 200,
                  imageList2[index].imagePath,
                );
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Eat What you Love",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3, // Set the number of columns here
              children: List.generate(imageList3.length, (index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.9,
                          color: const Color(0xff901020), // Outer border color
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(
                            4.0), // Adjust the padding as needed
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0, // Width of the inner border
                            color: Colors.white, // Inner border color
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          height: 80,
                          width: 80,
                          imageList3[index].imagePath,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("hbvbdzbv")
                  ],
                );
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Celebarte with Qmin",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: aryan.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Image.asset(aryan[index])),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffFEDA75),
                        Color(0xffFA7E1E),
                        Color(0xffD62976),
                        Color(0xff962FBF),
                        Color(0xff4F5BD5),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("asset/image/instagram.png"),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Follow us on Instagram",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 161,
              width: MediaQuery.of(context).size.width,
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "asset/image/Logo.png",
                      color: Color(0xff979BA2),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Order in and eat what you love with ease. Qmin delivers the most flavourful meals right at your doorstep.",
                      style: TextStyle(
                          color: Color(0xff979BA2),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
