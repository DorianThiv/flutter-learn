class NetworkService {
  // Network service

  static String token = '';

  String proto = 'https:';
  String host = 'localhost';
  int uriport = 44342;
  String path = '/api/';

  String get uri {
    return '${this.proto}//${this.host}:${this.uriport}${this.path}';
  }

  // public get isConnected(): boolean { return this.token ? true : false; }

  // public get url() { return `${this.proto}//${this.host}:${this.port}/#/`; }

  // public get wsUri() { return 'wss://${this.host}:${this.uriport}${this.api}'; }

  constructor() {}
}
