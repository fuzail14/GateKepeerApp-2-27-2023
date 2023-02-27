const String imageBaseUrl =
    'http://192.168.100.117:8080/mia-society-app-laravel-api/public/storage/';

class Api {
  static const String baseUrl = 'http://192.168.2.45:8080/api/';
  static const String login = baseUrl + "login";
  static const String fcmtokenrefresh = baseUrl + "fcmtokenrefresh";
  static const String preapproventrynotifications =
      baseUrl + "preapproventrynotifications";
  static const String preapproveentryresidents =
      baseUrl + "preapproveentryresidents";
  static const String updatepreapproveentrystatus =
      baseUrl + "updatepreapproveentrystatus";
  static const String preapproveentries = baseUrl + "preapproveentries";
  static const String viewallnoticesapi = baseUrl + "viewallnotices";
  static const String viewevent = baseUrl + "event/events";
  static const String chatgatekeepers = baseUrl + "chatgatekeepers";
  static const String chatneighbours = baseUrl + "chatneighbours";
  static const String viewconversationsneighbours =
      baseUrl + "viewconversationsneighbours";
  static const String conversations = baseUrl + "conversations";
  static const String createchatroom = baseUrl + "createchatroom";
  static const String fetchchatroomusers = baseUrl + "fetchchatroomusers";
}
