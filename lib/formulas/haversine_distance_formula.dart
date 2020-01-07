import 'dart:math';

class DistanceFromLocation {
  double latitude1;
  double longitude1;

  double latitude2;
  double longitude2;

  DistanceFromLocation.fromDegrees(
      {this.latitude1, this.longitude1, this.latitude2, this.longitude2}) {
    this.latitude1 = _radiansFromDegrees(latitude1);
    this.longitude1 = _radiansFromDegrees(longitude1);

    this.latitude2 = _radiansFromDegrees(latitude2);
    this.longitude2 = _radiansFromDegrees(longitude2);
  }

  double haversineDistance() {
    return HaversineFormula.distance(
        this.latitude1, this.longitude1, this.latitude2, this.longitude2);
  }

  double _radiansFromDegrees(final double degrees) => degrees * (pi / 180.0);
}

class HaversineFormula {
  static double distance(double lat1, lon1, lat2, lon2) {
    var earthRadius = 6378137.0;
    double distance = 2 * earthRadius * asin(
        sqrt(
            pow(sin(lat2 - lat1) / 2, 2)
                + cos(lat1)
                * cos(lat2)
                * pow(sin(lon2 - lon1) / 2, 2)
        )
    );
    distance = distance / 1000;
    return distance;
  }
}