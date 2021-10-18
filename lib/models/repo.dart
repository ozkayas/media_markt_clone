import 'package:flutter/material.dart';
import 'package:media_markt_clone/models/drawer_item.dart';

List<DrawerItem> drawerItems = [
  DrawerItem(Icons.person, 'Hesabım', '/myAccount'),
  DrawerItem(Icons.local_shipping_sharp, 'Sipariş Takibi', '/orderFollow'),
  DrawerItem(Icons.confirmation_num_sharp, 'Kolay Iade', '/easyReturn'),
  DrawerItem(Icons.shopping_cart_sharp, 'Siparişlerim', '/myOrders'),
  DrawerItem(Icons.favorite_sharp, 'Favorilerim', '/myFavorites'),
  DrawerItem(Icons.compare_arrows_sharp, 'Karşılaştırma Listesi', '/compare'),
  DrawerItem(Icons.mail_sharp, 'Mesajlar', '/messages'),
  DrawerItem(Icons.thumb_up_sharp, 'MediaMarkt CLUB', '/mediaMarktClub'),
];

List<DrawerItem> secondaryDrawerItems = [
  DrawerItem(Icons.location_pin, 'Mağaza Bul', '/findStore'),
  DrawerItem(Icons.local_shipping_sharp, 'Stok Sorgulama', '/stockSearch'),
  DrawerItem(Icons.confirmation_num_sharp, 'Bize Ulaşın', '/contactUs'),
  DrawerItem(Icons.shopping_cart_sharp, 'Ayarlar', '/settings'),
];

List<String> carouselItems = [
  'assets/carousel1.jpg',
  'assets/carousel2.jpg',
  'assets/carousel3.jpg',
  'assets/carousel4.jpg',
  'assets/carousel5.jpg',
];
