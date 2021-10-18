/// Singleton class to store and mangae app text strings
class AppTxt {
  static AppTxt? _instance;

  static AppTxt get instance {
    return _instance ??= AppTxt._();
  }

  AppTxt._();

  /////////// TEXT NAMES /////////////
  String kProductSearch = 'Ürün Arama';
  String kTabHomePage = 'Anasayfa';
  String kTabProducts = 'Ürünler';
  String kTabShoppingCart = 'Sepet';
  String kChosenForYou = 'Sizin İçin Seçtiklerimiz';
  String kMMSuggests = 'Media Markt Öneriyor';
}
