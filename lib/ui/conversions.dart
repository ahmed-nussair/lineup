int _n = 78; // N (North)
int _s = 83; // S (South)
int _e = 69; // E (East)
int _w = 87; // W (West)

String _convertToDms(double value) {
  double degree = value;

  double minutes = (degree - degree.toInt().toDouble()) * 60;

  double seconds = (minutes - minutes.toInt().toDouble()) * 60;

  return '${degree.toInt().toString().padLeft(2, '0')}\u00BA'
      '${minutes.toInt().toString().padLeft(2, '0')}\''
      '${seconds.toInt().toString().padLeft(2, '0')}\"';
}

String _convertLatitudeToDms(double latitude) {
  String result;
  int charCode = latitude >= 0 ? _n : _s;
  return '${_convertToDms(latitude)}${String.fromCharCode(charCode)}';
}

String _convertLongitudeToDms(double longitude) {
  String result;
  int charCode = longitude >= 0 ? _e : _w;
  return '${_convertToDms(longitude)}${String.fromCharCode(charCode)}';
}

String convertLocationToDms(double latitude, double longitude) {
  return '${_convertLatitudeToDms(latitude)} ${_convertLongitudeToDms(longitude)}';
}
