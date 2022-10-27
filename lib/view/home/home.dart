import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resumemaker/constants/style.dart';

import '../new_resume/new_resume.dart';
import 'components/home_list_item.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> tabItems = [
    HomeListItem(),
    Center(child: Text("2")),
    Center(child: Text("3")),
  ];

  int? currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Maker'),
      ),
      body: Center(
        child: tabItems[currentIndex!],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewResume()));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        elevation: 10,
        tilesPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        items: const <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: primary,
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              // color: Colors.red,
            ),
            title: Text("Home"),
          ),
          BubbleBottomBarItem(
              backgroundColor: primary,
              icon: Icon(
                Icons.download,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.download,
              ),
              title: Text("Downloads"),),
          BubbleBottomBarItem(
              backgroundColor: primary,
              icon: FaIcon(FontAwesomeIcons.info, color: Colors.black,),
              activeIcon:  FaIcon(FontAwesomeIcons.info, ),
              title: Text("About"),),
        ],
      ),
    );
  }
}