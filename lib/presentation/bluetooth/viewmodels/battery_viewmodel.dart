import 'package:shared_preferences/shared_preferences.dart';

class BatteryViewModel {
  double? dataSpeedster;
  double? dataDuro;
  double? estRangeSpeedster = null;
  double? estRangeDuro = null;
  String? selectedBattery = null;

  final maxSpeedster = 84.0;
  final minSpeedster = 60.0;

  final maxDuro = 67.2;
  final minDuro = 48.0;

  void setBatteryData(int? voltage) {
    if (voltage == null) return;

    dataSpeedster =
        (voltage - minSpeedster) / ((maxSpeedster - minSpeedster) / 100);
    dataDuro = (voltage - minDuro) / ((maxDuro - minDuro) / 100);
    setEstRange();
  }

  void setEstRange() {
    estRangeSpeedster =
        this.dataSpeedster != null ? this.dataSpeedster! * 0.75 : null;
    estRangeDuro = this.dataDuro != null ? this.dataDuro! * 0.75 : null;
  }

  Future saveDataBatteryInfo(String? selectedBattery, String deviceId) async {
    this.selectedBattery = selectedBattery;
    final pref = await SharedPreferences.getInstance();
    if (selectedBattery != null) {
      pref.setString('selectedBattery_${deviceId}', selectedBattery);
    }
  }

  Future<String?> getDataBatteryInfo(String deviceId) async {
    final pref = await SharedPreferences.getInstance();
    this.selectedBattery = pref.getString('selectedBattery_${deviceId}');
    return selectedBattery;
  }

  String getBatteryPercentage() {
    var value = '--';
    if (selectedBattery != null) {
      double? dataSpeedster = null;
      if (this.dataSpeedster != null && selectedBattery == 'Speedster') {
        dataSpeedster = this.dataSpeedster! > 100
            ? 100
            : this.dataSpeedster! < 0
                ? 0
                : this.dataSpeedster;
        return '${dataSpeedster?.toInt()}';
      }
      double? dataDuro = null;
      if (this.dataDuro != null && selectedBattery == 'Duro') {
        dataDuro = this.dataDuro! > 100
            ? 100
            : this.dataDuro! < 0
                ? 0
                : this.dataDuro;
        return '${dataDuro?.toInt()}';
      }
    }
    return value;
  }

  String getEstRange() {
    double? estRangeDuro = this.estRangeDuro;
    double? estRangeSpeedster = this.estRangeSpeedster;
    var value = '--';
    if ((estRangeDuro != null || estRangeSpeedster != null) &&
        selectedBattery != null) {
      estRangeDuro = estRangeDuro! < 0 ? 0 : estRangeDuro;
      estRangeSpeedster = estRangeSpeedster! < 0 ? 0 : estRangeSpeedster;
      value =
          '${selectedBattery == 'Duro' ? estRangeDuro.toInt() : estRangeSpeedster.toInt()}';
    }
    return value;
  }

  void resetBatteryData() {
    dataSpeedster = null;
    dataDuro = null;
  }
}
