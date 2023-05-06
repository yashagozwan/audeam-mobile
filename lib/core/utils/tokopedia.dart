class Tokopedia {
  static Uri getUrl(String name) {
    const baseUrl = 'https://www.tokopedia.com';
    final query = 'search?st=product&q=$name';
    final url = '$baseUrl/$query&srp_component_id=01.07.00.00&srp_page_id=&srp_page_title=&navsource=';
    return Uri.parse(url);
  }
}
