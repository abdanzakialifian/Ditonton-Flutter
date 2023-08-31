import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/io_client.dart';

class NetworkHttpClient {
  HttpClient? client;

  Future<SecurityContext> get _globalContext async {
    final sslCertificate =
        await rootBundle.load("certificates/certificates.pem");
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    securityContext
        .setTrustedCertificatesBytes(sslCertificate.buffer.asInt8List());
    return securityContext;
  }

  IOClient httpClient() {
    _globalContext.then((value) {
      client = HttpClient(context: value);
      client?.badCertificateCallback = (cert, host, port) => false;
    });
    return IOClient(client);
  }
}
