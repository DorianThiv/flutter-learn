class NetworkService {
  // Network service

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static String token = '';
  static int uriport = 44342;
  static String path = '/api/';
  static String get host {
    return '192.168.11.2:${uriport}';
  }

  String proto = 'http:';
  // String host = 'localhost';

  // public get isConnected(): boolean { return this.token ? true : false; }

  // public get url() { return `${this.proto}//${this.host}:${this.port}/#/`; }

  // public get wsUri() { return 'wss://${this.host}:${this.uriport}${this.api}'; }

}
