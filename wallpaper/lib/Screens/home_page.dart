import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../utils/colors.dart';
import 'detail_wallpaper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List wallpaperList = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "5.jpg",
    "6.jpg",
    "7.jpg",
    "8.jpg",
    "9.jpg",
  ];

  late PageController _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.search,
                color: pinkColor,
                size: 35,
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.app_registration_outlined,
              size: 35,
              color: pinkColor,
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: 720.h,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    const ListTile(
                      title: Text(
                        "Today's",
                        style: TextStyle(
                            fontFamily: "mont",
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                            fontSize: 35),
                      ),
                      subtitle: Text(
                        "best picks",
                        style: TextStyle(
                            fontFamily: "mont",
                            fontWeight: FontWeight.bold,
                            color: pinkColor,
                            fontSize: 30),
                      ),
                    ),
                    StaggeredGridView.countBuilder(
                      padding: const EdgeInsets.all(8.0),
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: wallpaperList.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailWallpaper(
                                      image: "assets/${i + 1}.jpg"))),
                          child: Hero(
                            tag: "assets/$i.jpg",
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: FadeInImage(
                                image: AssetImage("assets/${i + 1}.jpg"),
                                fit: BoxFit.cover,
                                placeholder: const AssetImage("assets/wp.png"),
                              ),
                            ),
                          ),
                        );
                      },
                      staggeredTileBuilder: (i) =>
                          StaggeredTile.count(2, i.isEven ? 2 : 3),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    )
                  ],
                ),
              ),
            ),
            // Bottom Navigation
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
              child: Container(
                decoration: BoxDecoration(
                    color: pinkColor, borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                  child: CupertinoTabBar(
                      border: const Border(top: BorderSide(color: pinkColor)),
                      backgroundColor: pinkColor,
                      currentIndex: pageIndex,
                      inactiveColor: Colors.white,
                      onTap: onTap,
                      activeColor: blackColor,
                      // inactiveColo r: Colors.grey,
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.favorite),
                        ),
                        BottomNavigationBarItem(icon: Icon(Icons.person)),
                        BottomNavigationBarItem(icon: Icon(Icons.settings)),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
