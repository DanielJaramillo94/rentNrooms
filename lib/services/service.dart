class Api {
  final String api1 = 'http://ec2-34-195-214-219.compute-1.amazonaws.com:8000';
  final String api2 = 'https://0kaup1m6dg.execute-api.us-east-1.amazonaws.com/dev';
  final String api3 = 'http://ec2-13-58-217-208.us-east-2.compute.amazonaws.com/api';

  List<String> searchEndPoint(String codeCity, DateTime checkin, DateTime checkout) {
    String search =  '/rooms/search?location=$codeCity&checkin=$checkin&checkout=$checkout';
    String url1 = this.api1+search;
    String url2 = this.api2+search;
    String url3 = this.api3+search;
    List<String> urls = [url1, url2, url3]
    return urls;
  }

  String detailsEndPoint(String id, String agencyName) {
    String details = '/rooms/$id';
    String api = '';
    switch (agencyName) {
      case 'Arrendamientos njs':
        api = this.api3;
        break;
      case 'S_TEAM':
        api = this.api1;
        break;
      case 'Lambda Team':
        api = this.api2;
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
        api = this.api3;
        break;
      case 'S_TEAM':
        api = this.api1;
        break;
      case 'Lambda Team':
        api = this.api2;
        break;
      default:
        api = '';
    }
    return api+booking;
  }

}