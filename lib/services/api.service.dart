class ApiService {
  static String api1Python = 'http://ec2-34-195-214-219.compute-1.amazonaws.com:8000';
  static String api2Lambda = 'https://0kaup1m6dg.execute-api.us-east-1.amazonaws.com/dev';
  static String api3NodeJs = 'http://ec2-13-58-217-208.us-east-2.compute.amazonaws.com/api';
  static String api4Scala = 'https://rent-rooms.herokuapp.com';

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

    static List<String> searchEndPointLambda() {
    String checkin = DateTime.now().toString().split(" ")[0];
    String checkout = DateTime.now().add(Duration(days: 365)).toString().split(" ")[0];
      
    String searchMDE =  '/rooms/search?location=MDE&checkin=$checkin&checkout=$checkout';
    String searchBOG =  '/rooms/search?location=BOG&checkin=$checkin&checkout=$checkout';
    String searchCLO =  '/rooms/search?location=CLO&checkin=$checkin&checkout=$checkout';
    String searchBAQ =  '/rooms/search?location=BAQ&checkin=$checkin&checkout=$checkout';

    List<String> urls = [];
    urls.add(api2Lambda + searchMDE);
    urls.add(api2Lambda + searchBOG);
    urls.add(api2Lambda + searchCLO);
    urls.add(api2Lambda + searchBAQ);

    return urls;
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

  // static String detailsEndPoint(String id, String agencyName) {
  //   String details = '/rooms/$id';
  //   String api = '';
  //   switch (agencyName) {
  //     case 'Arrendamientos njs':
  //       api = api3NodeJs;
  //       break;
  //     case 'Python':
  //       api = api1Python;
  //       break;
  //     case 'Lambda Team':
  //       api = api2Lambda;
  //       break;
  //     default:
  //       api = '';
  //   }
  //   return api+details;
  // }

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
      case 'Agencia Scala':
        booking = '/booking';
        api = api4Scala;
        break;
      default:
        api = '';
    }
    return api+booking;
  }


  // ❗ Hopefully we could entirely refactor this service later
  // ⚠️ temporally ⚠️ For using the fake enpoints, do next:
  // ⚠️ change processEnv variable from 'prod' to 'dev'
  // ⚠️ toogle apiUrls variable from the real ones to the fake ones
  static String processEnv = 'prod';

  static Map<String, String> apiUrls = {
    'Python': 'http://ec2-34-195-214-219.compute-1.amazonaws.com:8000',
    'Lambda Team': 'https://0kaup1m6dg.execute-api.us-east-1.amazonaws.com/dev',
    'Arrendamientos njs': 'http://ec2-13-58-217-208.us-east-2.compute.amazonaws.com/api',
    'Agencia Scala': 'https://rent-rooms.herokuapp.com',
  };

  // static Map<String, String> apiUrls = {
  //   'Agency1': 'https://next.json-generator.com/api/json/get/EJI3axNsd',
  //   'Agency2': 'https://next.json-generator.com/api/json/get/41yh2gEsd',
  //   'Agency3': 'https://next.json-generator.com/api/json/get/NyXqvgEj_',
  // };

  static List<String> getApiUrls() {
    List<String> apiUrlsList = new List();
    apiUrls.forEach((key, value) => apiUrlsList.add(value));
    return apiUrlsList;
  }

  static List<String> searchEndPoints(String codeCity, String checkin, String checkout) {
    String searchUrl;
    if (processEnv == 'dev') {
      searchUrl = '';
    } else {
      searchUrl = '/rooms/search?location=$codeCity&checkin=$checkin&checkout=$checkout';
    }
    List<String> returnList = getApiUrls().map((url) => url+searchUrl).toList();
    return returnList;
  }

  static String getAgencyEndPoint(String agencyName) {
    return apiUrls[agencyName];
  }

  static String detailsEndPoint(String agencyName, String id) {
    String detailsUrl;
    if (processEnv == 'dev') {
      //siempre es la misma url para las pruebas. Usar cualquiera de las dos siguientes.
      // return 'https://next.json-generator.com/api/json/get/4y66UeHo_';
      return 'https://next.json-generator.com/api/json/get/NyuzrZwoO';
    } else {
      detailsUrl = '/rooms/$id';
    }
    try {
      return getAgencyEndPoint(agencyName) + detailsUrl;
    } catch (e) {
      return '' + detailsUrl;
    }
  }
  
  static List<String> bookings(String email) {
    String bookingsUrl;
    if (processEnv == 'dev') {
      return [
        'https://next.json-generator.com/api/json/get/41s1fPpod',
        // 'https://next.json-generator.com/api/json/get/41s1fPpod'
      ];
    } else {
      bookingsUrl = '/booking/$email';
    }
    List<String> returnList =
        getApiUrls().map((url) => url + bookingsUrl).toList();
    return returnList;
  }
}