import 'package:flutter/material.dart';
import 'package:media_markt_clone/models/repo.dart';
import 'package:media_markt_clone/widgets/drawer_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(),
        appBar: _buildAppBar(size, context),
        bottomNavigationBar: _bottomNavBar(),
        drawer: _drawer(),
      ),
    );
  }

  Drawer _drawer() => Drawer(
          child: ListView(
        children: [
          SizedBox(
              height: 60,
              child: Image.asset(
                'assets/Media_Markt_logo.png',
              )),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HESAP',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...drawerItems.map((item) => DrawerItemRow(item: item)).toList()
              ],
            ),
          )
        ],
      ));

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _selectTab,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Anasayfa'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_sharp), label: 'Ürünler'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Sepet'),
        ]);
  }

  AppBar _buildAppBar(Size size, BuildContext context) => AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 8,
        elevation: 0,
        toolbarHeight: size.height * 0.08,
        title: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Builder(
            builder: (BuildContext context) => Row(
              children: [
                IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.grey,
                    )),
                Expanded(
                    child: TextField(
                  cursorHeight: 22,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Ürün arama"),
                )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search, color: Colors.grey)),
              ],
            ),
          ),
        ),
      );
}
