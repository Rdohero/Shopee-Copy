import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:shoope_copy/Widget/list.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> imageUrls = [
    "assets/Images/barang/barang_1.jpeg",
    "assets/Images/barang/barang_2.jpeg",
    "assets/Images/barang/barang_3.jpeg",
    "assets/Images/barang/barang_4.jpeg",
    "assets/Images/barang/barang_5.jpeg",
    "assets/Images/barang/barang_6.jpeg",
    "assets/Images/barang/barang_7.jpeg",
    "assets/Images/barang/barang_8.jpeg",
    "assets/Images/barang/barang_9.jpeg",
    "assets/Images/barang/barang_10.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 7),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.camera_alt_outlined),
                  hintText: "Cari...",
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintStyle: TextStyle(color: Color(0xFFEE4D2D)),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage("assets/Images/cart.png"),
              color: Color(0xFFEF4D29),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage("assets/Images/chat.png"),
              color: Color(0xFFEF4D29),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 3.77/2,
              child: AnotherCarousel(
                images: const [
                  AssetImage("assets/Images/Images_Slider/slide_1.png"),
                  AssetImage("assets/Images/Images_Slider/slide_2.png"),
                  AssetImage("assets/Images/Images_Slider/slide_3.png"),
                ],
                dotSize: 5,
                dotIncreaseSize: 1.1,
                dotBgColor: Colors.transparent,
                dotSpacing: 15,
                dotIncreasedColor: const Color(0xFFEE4D2D),
              ),
            ),
            AspectRatio(
              aspectRatio: 6/2,
              child: Container(
                color: const Color(0xFFEE4D2D),
                child: Row(
                  children: [
                    listShopee("assets/Images/Images_Button/tagihan.png", "Pulsa, Tagihan, dan, Listrik",const Color(0xFF26AA99)),
                    listShopee("assets/Images/Images_Button/ongkir.png", "Gratis Ongkir dan Voucher",const Color(0xFFFFBB00)),
                    listShopee("assets/Images/Images_Button/shoope_food.png", "ShopeeFood",const Color(0xFFEE4D2D)),
                    listShopee("assets/Images/Images_Button/shoope_game.png", "Shopee Games",const Color(0xFF2673DD)),
                    listShopee("assets/Images/Images_Button/lihat.png", "Lihat Semua",const Color(0xFFEE4D2D)),
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 4/2,
              child: Container(
                color: const Color(0xFFFFEBD6),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text("HADIAH GRATIS",style: TextStyle(color: Color(0xFFEE4D2D)),),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Lihat Semua >",
                                style: TextStyle(
                                    color: Color(0xFFEE4D2D),
                                    fontWeight: FontWeight.normal),
                              )
                          ),
                        ],
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 10/3.4,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 2);
                        },
                        itemCount: imageUrls.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AspectRatio(
                            aspectRatio: 10.8/13,
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1/1,
                                    child: Image(
                                      image:AssetImage(imageUrls[index]),
                                    ),
                                  ),
                                  const Text(
                                    "Rp 1",
                                    style:
                                    TextStyle(color: Color(0xFFEE4D2D)),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 25/1,
              child: Container(
                color: const Color(0xFFF5F5F5),
              ),
            ),
            AspectRatio(
              aspectRatio: 14/2,
              child: Container(
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10, top: 15),
                  child: Text(
                    "REKOMENDASI",
                    style: TextStyle(
                      color: Color(0xFFEE4D2D),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                childAspectRatio: 1/1.47,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (_ ,index) {
                return Container(
                  margin: const EdgeInsets.only(left: 5),
                  color: Colors.white,
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1/1,
                        child: Image.asset(
                          imageUrls[index],
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5, top: 5),
                            child: Text(
                              "dompet kulit sintetis dompet lupat pria dompet",
                              style: TextStyle(fontSize: 13,height: 1.2),
                              maxLines: 2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 7,left: 6),
                            child: Image(
                              image: AssetImage("assets/Images/cod.png"),
                              height: 13,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5,top: 7),
                            child: Row(
                              children: [
                                Text(
                                  "Rp19.780",
                                  style: TextStyle(color: Color(0xFFEE4D2D)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 3),
                                  child: Text(
                                    "10RB+ sold",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 19),
                                  child: Image(
                                    image: AssetImage(
                                      "assets/Images/titik3.png",
                                    ),
                                    width: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}