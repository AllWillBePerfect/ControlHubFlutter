// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_api_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CapabilitiesResponse _$CapabilitiesResponseFromJson(
  Map<String, dynamic> json,
) => _CapabilitiesResponse(
  agent: json['agent'] as String,
  capabilities: (json['capabilities'] as List<dynamic>)
      .map((e) => CapabilityApiModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CapabilitiesResponseToJson(
  _CapabilitiesResponse instance,
) => <String, dynamic>{
  'agent': instance.agent,
  'capabilities': instance.capabilities,
};

SelectorApiModel _$SelectorApiModelFromJson(Map<String, dynamic> json) =>
    SelectorApiModel(
      id: json['id'] as String,
      title: json['title'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => OptionApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedId: json['selectedId'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$SelectorApiModelToJson(SelectorApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'options': instance.options,
      'selectedId': instance.selectedId,
      'type': instance.$type,
    };

GaugeApiModel _$GaugeApiModelFromJson(Map<String, dynamic> json) =>
    GaugeApiModel(
      id: json['id'] as String,
      title: json['title'] as String,
      value: (json['value'] as num).toDouble(),
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
      unit: json['unit'] as String? ?? '',
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$GaugeApiModelToJson(GaugeApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'value': instance.value,
      'min': instance.min,
      'max': instance.max,
      'unit': instance.unit,
      'type': instance.$type,
    };

ToggleApiModel _$ToggleApiModelFromJson(Map<String, dynamic> json) =>
    ToggleApiModel(
      id: json['id'] as String,
      title: json['title'] as String,
      isOn: json['isOn'] as bool,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ToggleApiModelToJson(ToggleApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isOn': instance.isOn,
      'type': instance.$type,
    };

SliderApiModel _$SliderApiModelFromJson(Map<String, dynamic> json) =>
    SliderApiModel(
      id: json['id'] as String,
      title: json['title'] as String,
      value: (json['value'] as num).toDouble(),
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
      step: (json['step'] as num?)?.toDouble(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$SliderApiModelToJson(SliderApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'value': instance.value,
      'min': instance.min,
      'max': instance.max,
      'step': instance.step,
      'type': instance.$type,
    };

_OptionApiModel _$OptionApiModelFromJson(Map<String, dynamic> json) =>
    _OptionApiModel(
      id: json['id'] as String,
      title: json['title'] as String,
      defaultTitle: json['defaultTitle'] as String?,
      hidden: json['hidden'] as bool? ?? false,
    );

Map<String, dynamic> _$OptionApiModelToJson(_OptionApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'defaultTitle': instance.defaultTitle,
      'hidden': instance.hidden,
    };

SelectCommandApiModel _$SelectCommandApiModelFromJson(
  Map<String, dynamic> json,
) => SelectCommandApiModel(
  optionId: json['optionId'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$SelectCommandApiModelToJson(
  SelectCommandApiModel instance,
) => <String, dynamic>{'optionId': instance.optionId, 'type': instance.$type};

ToggleCommandApiModel _$ToggleCommandApiModelFromJson(
  Map<String, dynamic> json,
) => ToggleCommandApiModel(
  isOn: json['isOn'] as bool,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$ToggleCommandApiModelToJson(
  ToggleCommandApiModel instance,
) => <String, dynamic>{'isOn': instance.isOn, 'type': instance.$type};

ValueCommandApiModel _$ValueCommandApiModelFromJson(
  Map<String, dynamic> json,
) => ValueCommandApiModel(
  value: (json['value'] as num).toDouble(),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$ValueCommandApiModelToJson(
  ValueCommandApiModel instance,
) => <String, dynamic>{'value': instance.value, 'type': instance.$type};
