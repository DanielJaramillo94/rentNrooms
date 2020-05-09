class Api {
  final String api1Python = 'http://ec2-34-195-214-219.compute-1.amazonaws.com:8000';
  final String api2Lambda = 'https://0kaup1m6dg.execute-api.us-east-1.amazonaws.com/dev';
  final String api3NodeJs = 'http://ec2-13-58-217-208.us-east-2.compute.amazonaws.com/api';
  final String api4Scala = 'http://ec2-18-188-220-151.us-east-2.compute.amazonaws.com/';

  List<String> searchEndPoint(String codeCity, DateTime checkin, DateTime checkout) {
    String search =  '/rooms/search?location=$codeCity&checkin=$checkin&checkout=$checkout';
    String url1 = this.api1Python+search;
    String url2 = this.api2Lambda+search;
    String url3 = this.api3NodeJs+search;
    List<String> urls = [url1, url2, url3];
    return urls;
  }

  String detailsEndPoint(String id, String agencyName) {
    String details = '/rooms/$id';
    String api = '';
    switch (agencyName) {
      case 'Arrendamientos njs':
        api = this.api3NodeJs;
        break;
      case 'S_TEAM':
        api = this.api1Python;
        break;
      case 'Lambda Team':
        api = this.api2Lambda;
        break;
      default:
        api = '';
    }
    return api+details;
  }

  String bookingEndPoint(String agencyName) {
    String booking = '/booking/';
    String api = '';
    switch (agencyName) {
      case 'Arrendamientos njs':
        api = this.api3NodeJs;
        break;
      case 'S_TEAM':
        booking = '/rooms/booking';
        api = this.api1Python;
        break;
      case 'Lambda Team':
        api = this.api2Lambda;
        break;
      default:
        api = '';
    }
    return api+booking;
  }

}