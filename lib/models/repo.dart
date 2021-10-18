import 'package:flutter/material.dart';
import 'package:media_markt_clone/models/drawer_item.dart';
import 'package:media_markt_clone/models/product.dart';

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

List<Product> homeShowcaseProducts = [
  Product(
      name: 'APPLE iPhone 13',
      description: 'Pro Max 256 GB',
      price: 18999,
      imageUrl:
          'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_87302616/fee_786_587_png/APPLE-iPhone-13-Pro-Max-256-GB-Ak%C4%B1ll%C4%B1-Telefon-Sierra-Blue'),
  Product(
      name: 'XIAOMI Redmi 9T',
      description: '4GB/128GB Akıllı Telefon',
      price: 3099,
      imageUrl:
          'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_85194156/fee_786_587_png'),
  Product(
      name: 'XIAOMI NOTE 10S',
      description: '64 GB Gri',
      price: 3549,
      imageUrl:
          'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_87029976/fee_786_587_png/XIAOMI-NOTE-10S-64-GB-Gri'),
  Product(
      name: 'SAMSUNG Galaxy S21+',
      description: '5G 128GB Akıllı Telefon',
      price: 11999,
      imageUrl:
          'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_83681124/fee_786_587_png/SAMSUNG-Galaxy-S21--5G-128GB-Ak%C4%B1ll%C4%B1-Telefon-Violet'),
  Product(
      name: 'OPPO Reno 5 Lite',
      description: '128GB Akıllı Telefon',
      price: 3999,
      imageUrl:
          'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_83277936/fee_786_587_png/OPPO-Reno-5-Lite-128GB-Ak%C4%B1ll%C4%B1-Telefon-Aurora-Moru'),
];
