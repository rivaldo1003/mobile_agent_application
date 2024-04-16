// ignore_for_file: public_member_api_docs, sort_constructors_first
class Trip {
  String? currentAddress;
  String? destination;
  double currentLat;
  double currentLong;
  double destLat;
  double destLong;

  Trip({
    required this.currentAddress,
    required this.destination,
    required this.currentLat,
    required this.currentLong,
    required this.destLat,
    required this.destLong,
  });

  @override
  String toString() {
    return 'Trip(currentAddress: $currentAddress, destination: $destination, currentLat: $currentLat, currentLong: $currentLong, destLat: $destLat, destLong: $destLong)';
  }
}
