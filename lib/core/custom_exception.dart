class RequestException implements Exception {
  String message;

  RequestException(this.message);

  @override
  String toString() {
    return message;
  }
}

class NoInternetException implements Exception {
  @override
  String toString() {
    return 'Please check your internet connection';
  }
}

class ConnectionTimeoutException implements Exception {
  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class VehicleNotFoundException implements Exception {
  @override
  String toString() {
    return 'Vehicle not found';
  }
}

class McuParseException implements Exception {
  @override
  String toString() {
    return 'Failed to parse MCU data';
  }
}
