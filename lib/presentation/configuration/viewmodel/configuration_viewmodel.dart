import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:elderselettricomobile/core/base/base_view_model.dart';
import 'package:elderselettricomobile/domain/model/config/config_form.dart';
import 'package:elderselettricomobile/domain/repository/config_repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../domain/model/config/config_result.dart';

class ConfigurationViewModel extends BaseViewModel {
  final _repository = Get.find<ConfigRepository>();

  List<TabItem> tabs = [];
  Map<int, List<ConfigForm>> configFormMap = {};
  Map<int, Map<int, dynamic>> formValueMap = {};

  List<ConfigData>? _additionalUploadData = null;

  get isLoading => _isLoading;
  bool _isLoading = false;

  Future<List<TabItem>> getPageTabs() async {
    try {
      final response =
          await rootBundle.loadString('assets/json/brt_config.json');
      final data = await json.decode(response);
      final configResult = ConfigResult.fromJson(data);
      tabs = configResult.tabs;
      _additionalUploadData = configResult.configData;
      await Future.wait(tabs.mapIndexed((index, element) async =>
          await getConfigFormByKey(index, element.key)));
      notifyListeners();
    } catch (e) {}

    return tabs;
  }

  Future<void> getConfigFormByKey(int tabIndex, String key) async {
    final response = await rootBundle.loadString('assets/json/$key.json');
    final List<dynamic> data = await json.decode(response);
    Map<int, dynamic> formValues = {};
    final forms = data.map((c) {
      final configForm = ConfigForm.fromJson(c);
      if (configForm.index != null) {
        formValues[configForm.index!] = configForm.defaultValue;
      }
      return configForm;
    }).toList();
    formValueMap[tabIndex] = formValues;
    configFormMap[tabIndex] = forms;
  }

  Future<void> getConfigValue(int controllerType) async {
    final result =
        await _repository.getCurrentConfigByController(controllerType);
    result.fold((l) {}, (configList) {});
  }

  void updateFormValue({
    required final int tabIndex,
    required final int formIndex,
    required dynamic value,
  }) {
    formValueMap[tabIndex]![formIndex] = value.toInt();
    notifyListeners();
  }

  void getUploadData() {
    Map<int, dynamic> values = {};

    formValueMap.forEach((key, element) {
      values.addAll(element);
    });

    _additionalUploadData?.forEach((d) {
      values[d.index] = int.parse(d.value);
    });

    print("ConfigForm, sorted values: $values");
  }
}
