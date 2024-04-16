import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/model/mcu.dart';
import '../../../flavors.dart';
import '../../../core/utils/configurations.dart';
import '../../../core/values/constants.dart';

class WriteLogViewModel extends ChangeNotifier {
  var _writeLogCounter = 0;
  var _lastWriteCount = 0;
  File? _logFile = null;

  var _isWriteLog = false;
  bool get isWriteLog => _isWriteLog;

  Future<void> createLogFile() async {
    print('WriteDataLog, create log file');
    try {
      final directory = await getApplicationDocumentsDirectory();
      final publicPath = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOCUMENTS);
      final path = Platform.isAndroid ? publicPath : directory.path;
      final folderPath = '$path/Elders Elettrico';
      await Directory(folderPath).create();
      _logFile = File(
          '$folderPath/elders_log_${DateTime.now().millisecondsSinceEpoch}.txt');
    } catch (e) {
      print('WriteDataLog error: $e');
    }
  }

  void writeToLog(McuObject data) {
    if (FlavorConfig.appFlavor != Flavor.DEV) return;
    if (!isWriteLog ||
        _writeLogCounter != _lastWriteCount ||
        _writeLogCounter > 10000) return;
    if (_logFile == null) createLogFile();
    print('WriteDataLog, on write data to log');
    _lastWriteCount++;
    Future.delayed(Duration(milliseconds: 400), () async {
      if (_writeLogCounter == 0) {
        await _writeLogHeader();
      }
      final content =
          '${_writeLogCounter + 1}, ${DateTime.now().millisecondsSinceEpoch}, ${data.toJson()}\n';
      await _logFile!.writeAsString(content, mode: FileMode.append);
      _writeLogCounter++;
    });
  }

  Future<void> _writeLogHeader() async {
    final content = geConfigLoggingData() + 'frame_id, timestamp, data\n';
    await _logFile!.writeAsString(content, mode: FileMode.append);
  }

  Future<void> saveWriteLogState() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(KEY_WRITE_LOG, isWriteLog);
  }

  Future<void> getWriteLogState() async {
    if (FlavorConfig.appFlavor != Flavor.DEV) return;
    final pref = await SharedPreferences.getInstance();
    final value = pref.getBool(KEY_WRITE_LOG);
    _isWriteLog = value ?? false;
    notifyListeners();
  }

  void setWriteLogState(bool value) {
    _isWriteLog = value;
    notifyListeners();
  }
}
