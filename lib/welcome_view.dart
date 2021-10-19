import 'package:flutter/material.dart';
import 'package:media_markt_clone/models/repo.dart';
import 'package:media_markt_clone/views/app_text.dart/app_text.dart';
import 'package:media_markt_clone/views/cart_view.dart';
import 'package:media_markt_clone/views/home_view.dart';
import 'package:media_markt_clone/views/products_view.dart';
import 'package:media_markt_clone/widgets/drawer_item.dart';
import 'package:showcaseview/showcaseview.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView>
    with SingleTickerProviderStateMixin {
  final _appbarKey = GlobalKey();
  int _selectedTab = 0;
  late AppTxt txt;
  BuildContext? myContext;
  late FocusNode _focusNode;
  late TextEditingController _searchBarController;
  late AnimationController _iconAnimationController;

  void _selectTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  List<Widget> tabPages = [HomeView(), ProductsView(), CartView()];

  @override
  void initState() {
    super.initState();
    txt = AppTxt.instance;
    _searchBarController = TextEditingController();
    _iconAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    /// initialize focusnode and start listening
    _focusNode = FocusNode();
    // _focusNode.addListener(() {
    //   if (_focusNode.hasFocus) {
    //     setState(() {
    //       ShowCaseWidget.of(myContext!)!.startShowCase([_appbarKey]);
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: ShowCaseWidget(onFinish: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        _iconAnimationController.reverse();

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }, builder: Builder(builder: (context) {
        myContext = context;
        return Scaffold(
          body: tabPages[_selectedTab],
          appBar: _buildAppBar(size, context),
          bottomNavigationBar: _bottomNavBar(),
          drawer: _drawer(),
        );
      })),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HESAP',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...drawerItems
                    .map((item) => DrawerItemRow(item: item))
                    .toList(),
                Divider(),
                Text(
                  'DİĞER',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...secondaryDrawerItems
                    .map((item) => DrawerItemRow(item: item))
                    .toList(),
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
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: txt.kTabHomePage),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_sharp), label: txt.kTabProducts),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: txt.kTabShoppingCart),
        ]);
  }

  AppBar _buildAppBar(Size size, BuildContext context) => AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 8,
        elevation: 0,
        toolbarHeight: size.height * 0.08,
        title: Showcase(
          showcaseBackgroundColor: Colors.transparent,
          description: '',
          key: _appbarKey,
          child: Container(
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
                    icon: AnimatedIcon(
                        color: Colors.grey,
                        icon: AnimatedIcons.menu_arrow,
                        progress: _iconAnimationController),
                    // icon: Icon(
                    //   Icons.menu,
                    //   color: Colors.grey,
                    // ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchBarController,
                            onTap: () {
                              setState(() {
                                ShowCaseWidget.of(myContext!)!
                                    .startShowCase([_appbarKey]);
                                _iconAnimationController.forward();
                              });
                            },
                            focusNode: _focusNode,
                            cursorHeight: 22,
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: txt.kProductSearch),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              if (_searchBarController.text.isEmpty) {
                                _focusNode.requestFocus();

                                setState(() {
                                  ShowCaseWidget.of(myContext!)!
                                      .startShowCase([_appbarKey]);
                                  _iconAnimationController.forward();
                                });
                              }
                            },
                            icon: Icon(Icons.search, color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
