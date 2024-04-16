import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_form.freezed.dart';
part 'config_form.g.dart';

@freezed
class ConfigFormGroup with _$ConfigFormGroup {
  const factory ConfigFormGroup({
    String? title,
    required List<ConfigForm> child,
  }) = _ConfigFormGroup;

  factory ConfigFormGroup.fromJson(Map<String, dynamic> json) =>
      _$ConfigFormGroupFromJson(json);
}

@freezed
class ConfigForm with _$ConfigForm {
  const factory ConfigForm({
    required String title,
    required String inputType,
    int? min,
    int? max,
    dynamic defaultValue,
    String? unit,
    int? index,
    @Default([]) List<SelectionItem> selections,
    @Default(false) bool enabled,
    @Default(false) bool showEnabled,
  }) = _ConfigForm;

  factory ConfigForm.fromJson(Map<String, dynamic> json) =>
      _$ConfigFormFromJson(json);
}

@freezed
class SelectionItem with _$SelectionItem {
  const factory SelectionItem({
    String? key,
    String? label,
  }) = _SelectionItem;

  factory SelectionItem.fromJson(Map<String, dynamic> json) =>
      _$SelectionItemFromJson(json);
}

enum FormInputType {
  slider,
  textField,
  segmentedControl,
  unknown;

  static FormInputType getEnum(String type) {
    switch (type) {
      case 'slider':
        return FormInputType.slider;
      case 'segmented_control':
        return FormInputType.segmentedControl;
      default:
        return FormInputType.unknown;
    }
  }
}
