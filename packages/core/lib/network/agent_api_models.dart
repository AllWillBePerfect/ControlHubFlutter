import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_api_models.freezed.dart';
part 'agent_api_models.g.dart';

@freezed
abstract class CapabilitiesResponse with _$CapabilitiesResponse {
  const factory CapabilitiesResponse({
    required String agent,
    required List<CapabilityApiModel> capabilities,
  }) = _CapabilitiesResponse;

  factory CapabilitiesResponse.fromJson(Map<String, Object?> json) =>
      _$CapabilitiesResponseFromJson(json);
}

@Freezed(unionKey: 'type')
sealed class CapabilityApiModel with _$CapabilityApiModel {
  const factory CapabilityApiModel.selector({
    required String id,
    required String title,
    required List<OptionApiModel> options,
    String? selectedId,
  }) = SelectorApiModel;

  const factory CapabilityApiModel.gauge({
    required String id,
    required String title,
    required double value,
    required double min,
    required double max,
    @Default('') String unit,
  }) = GaugeApiModel;

  const factory CapabilityApiModel.toggle({
    required String id,
    required String title,
    required bool isOn,
  }) = ToggleApiModel;

  const factory CapabilityApiModel.slider({
    required String id,
    required String title,
    required double value,
    required double min,
    required double max,
    double? step,
  }) = SliderApiModel;

  factory CapabilityApiModel.fromJson(Map<String, Object?> json) =>
      _$CapabilityApiModelFromJson(json);
}

@freezed
abstract class OptionApiModel with _$OptionApiModel {
  const factory OptionApiModel({
    required String id,
    required String title,
    String? defaultTitle,
    @Default(false) bool hidden,
  }) = _OptionApiModel;

  factory OptionApiModel.fromJson(Map<String, Object?> json) => _$OptionApiModelFromJson(json);
}

@Freezed(unionKey: 'type')
sealed class CommandApiModel with _$CommandApiModel {
  const factory CommandApiModel.select({required String optionId}) = SelectCommandApiModel;
  const factory CommandApiModel.toggle({required bool isOn}) = ToggleCommandApiModel;
  const factory CommandApiModel.value({required double value}) = ValueCommandApiModel;

  factory CommandApiModel.fromJson(Map<String, Object?> json) =>
      _$CommandApiModelFromJson(json);
}
