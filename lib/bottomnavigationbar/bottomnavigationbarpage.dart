import 'package:flutter/material.dart';

import '../accountpage.dart';
import '../homepage/homepage.dart';
import '../suppotpage.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarPageState createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _currentIndex = 0;

  // Define your pages here
  final List<Widget> _pages = [
    HomePage(),
    const SupportPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff901020),
        toolbarHeight: 76,
        title: const Row(
          mainAxisAlignment:  MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Icon(Icons.place_outlined,color: Colors.white,size: 26),
            ),
            SizedBox(width: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Kurla",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                    Icon(Icons.keyboard_arrow_down,size: 30,),

                  ],
                ),
                Text("Kurla,Mumbai,mahara...",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)

              ],
            ),
            SizedBox(width: 5,),
          ],
        ),
        actions: const [
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.search_rounded,size: 35,),
          )
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Color(0xff901020)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support,color: Color(0xff901020)),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,color: Color(0xff901020)),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}




