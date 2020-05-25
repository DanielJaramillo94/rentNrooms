class ApiService {
  static String api1Python = 'http://ec2-34-195-214-219.compute-1.amazonaws.com:8000';
  static String api2Lambda = 'https://0kaup1m6dg.execute-api.us-east-1.amazonaws.com/prod';
  static String api3NodeJs = 'http://ec2-13-58-217-208.us-east-2.compute.amazonaws.com/api';
  static String api4Scala = 'http://ec2-18-188-220-151.us-east-2.compute.amazonaws.com/';

  static String searchEndPoint(String codeCity, String checkin, String checkout) {
    String search =  '/rooms/search?location=$codeCity&checkin=$checkin&checkout=$checkout';
    return api2Lambda+search;
    /* *******************************
    String url1 = api1Python+search;
    //String url2 = api2Lambda+search;
    String url3 = api3NodeJs+search;
    List<String> urls = [url1, url3];
    return urls;
    *******************************  */
  }

    static List searchAllEndPoint(String codeCity, String checkin, String checkout) {
      String search =  '/rooms/search?location=$codeCity&checkin=$checkin&checkout=$checkout';
      List urls = [];
      urls.add(api2Lambda + search);
      urls.add(api2Lambda + search);
      urls.add(api2Lambda + search);
    return urls;
    /* *******************************
    String url1 = api1Python+search;
    //String url2 = api2Lambda+search;
    String url3 = api3NodeJs+search;
    List<String> urls = [url1, url3];
    return urls;
    *******************************  */
  }

  static String detailsEndPoint(String id, String agencyName) {
    String details = '/rooms/$id';
    String api = '';
    switch (agencyName) {
      case 'Arrendamientos njs':
        api = api3NodeJs;
        break;
      case 'Python':
        api = api1Python;
        break;
      case 'Lambda Team':
        api = api2Lambda;
        break;
      default:
        api = '';
    }
    return api+details;
  }

  static String bookingEndPoint(String agencyName) {
    String booking = '/booking/';
    String api = '';
    switch (agencyName) {
      case 'Arrendamientos njs':
        api = api3NodeJs;
        break;
      case 'Python':
        booking = '/rooms/booking';
        api = api1Python;
        break;
      case 'Lambda Team':
        api = api2Lambda;
        break;
      default:
        api = '';
    }
    return api+booking;
  }


  // ❗ Hopefully we could entirely refactor this service later
  // ⚠️ temporally ⚠️ For using the fake enpoints, do next:
  // ⚠️ comment lines from 81 to 84 and 95
  // ⚠️ uncomment lines from 85 to 87 and 96

  static List<String> apiUrls =  [
    // 'http://ec2-34-195-214-219.compute-1.amazonaws.com:8000',
    'https://0kaup1m6dg.execute-api.us-east-1.amazonaws.com/prod',
    // 'http://ec2-13-58-217-208.us-east-2.compute.amazonaws.com/api',
    // 'http://ec2-18-188-220-151.us-east-2.compute.amazonaws.com/',
    // 'https://next.json-generator.com/api/json/get/EJI3axNsd',
    // 'https://next.json-generator.com/api/json/get/41yh2gEsd',
    // 'https://next.json-generator.com/api/json/get/NyXqvgEj_',
    ];

  static List<String> getApiUrls() {
    return apiUrls;
  }

  static List<String> searchEndPoints(String codeCity, String checkin, String checkout) {
    String searchUrl =  '/rooms/search?location=$codeCity&checkin=$checkin&checkout=$checkout';
    // String searchUrl =  '';
    return  getApiUrls().map((url) => url+searchUrl).toList();
  }
}