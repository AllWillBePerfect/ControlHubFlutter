// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_api_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CapabilitiesResponse {

 String get agent; List<CapabilityApiModel> get capabilities;
/// Create a copy of CapabilitiesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CapabilitiesResponseCopyWith<CapabilitiesResponse> get copyWith => _$CapabilitiesResponseCopyWithImpl<CapabilitiesResponse>(this as CapabilitiesResponse, _$identity);

  /// Serializes this CapabilitiesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CapabilitiesResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CapabilitiesResponse&&(identical(other.agent, _this.agent) || other.agent == _this.agent)&&const DeepCollectionEquality().equals(other.capabilities, _this.capabilities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CapabilitiesResponse;
  return Object.hash(runtimeType,_this.agent,const DeepCollectionEquality().hash(_this.capabilities));
}

@override
String toString() {
  final _this = this as CapabilitiesResponse;
  return 'CapabilitiesResponse(agent: ${_this.agent}, capabilities: ${_this.capabilities})';
}


}

/// @nodoc
abstract mixin class $CapabilitiesResponseCopyWith<$Res>  {
  factory $CapabilitiesResponseCopyWith(CapabilitiesResponse value, $Res Function(CapabilitiesResponse) _then) = _$CapabilitiesResponseCopyWithImpl;
@useResult
$Res call({
 String agent, List<CapabilityApiModel> capabilities
});




}
/// @nodoc
class _$CapabilitiesResponseCopyWithImpl<$Res>
    implements $CapabilitiesResponseCopyWith<$Res> {
  _$CapabilitiesResponseCopyWithImpl(this._self, this._then);

  final CapabilitiesResponse _self;
  final $Res Function(CapabilitiesResponse) _then;

/// Create a copy of CapabilitiesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? agent = null,Object? capabilities = null,}) {
  return _then(CapabilitiesResponse(
agent: null == agent ? _self.agent : agent // ignore: cast_nullable_to_non_nullable
as String,capabilities: null == capabilities ? _self.capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as List<CapabilityApiModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CapabilitiesResponse].
extension CapabilitiesResponsePatterns on CapabilitiesResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CapabilitiesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CapabilitiesResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CapabilitiesResponse value)  $default,){
final _that = this;
switch (_that) {
case _CapabilitiesResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CapabilitiesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CapabilitiesResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String agent,  List<CapabilityApiModel> capabilities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CapabilitiesResponse() when $default != null:
return $default(_that.agent,_that.capabilities);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String agent,  List<CapabilityApiModel> capabilities)  $default,) {final _that = this;
switch (_that) {
case _CapabilitiesResponse():
return $default(_that.agent,_that.capabilities);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String agent,  List<CapabilityApiModel> capabilities)?  $default,) {final _that = this;
switch (_that) {
case _CapabilitiesResponse() when $default != null:
return $default(_that.agent,_that.capabilities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CapabilitiesResponse implements CapabilitiesResponse {
  const _CapabilitiesResponse({required this.agent, required  List<CapabilityApiModel> capabilities}): _capabilities = capabilities;
  factory _CapabilitiesResponse.fromJson(Map<String, dynamic> json) => _$CapabilitiesResponseFromJson(json);

@override final  String agent;
 final  List<CapabilityApiModel> _capabilities;
@override List<CapabilityApiModel> get capabilities {
  if (_capabilities is EqualUnmodifiableListView) return _capabilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_capabilities);
}


/// Create a copy of CapabilitiesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CapabilitiesResponseCopyWith<_CapabilitiesResponse> get copyWith => __$CapabilitiesResponseCopyWithImpl<_CapabilitiesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CapabilitiesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CapabilitiesResponse&&(identical(other.agent, agent) || other.agent == agent)&&const DeepCollectionEquality().equals(other.capabilities, _capabilities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,agent,const DeepCollectionEquality().hash(_capabilities));
}

@override
String toString() {
    return 'CapabilitiesResponse(agent: $agent, capabilities: $capabilities)';
}


}

/// @nodoc
abstract mixin class _$CapabilitiesResponseCopyWith<$Res> implements $CapabilitiesResponseCopyWith<$Res> {
  factory _$CapabilitiesResponseCopyWith(_CapabilitiesResponse value, $Res Function(_CapabilitiesResponse) _then) = __$CapabilitiesResponseCopyWithImpl;
@override @useResult
$Res call({
 String agent, List<CapabilityApiModel> capabilities
});




}
/// @nodoc
class __$CapabilitiesResponseCopyWithImpl<$Res>
    implements _$CapabilitiesResponseCopyWith<$Res> {
  __$CapabilitiesResponseCopyWithImpl(this._self, this._then);

  final _CapabilitiesResponse _self;
  final $Res Function(_CapabilitiesResponse) _then;

/// Create a copy of CapabilitiesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? agent = null,Object? capabilities = null,}) {
  return _then(_CapabilitiesResponse(
agent: null == agent ? _self.agent : agent // ignore: cast_nullable_to_non_nullable
as String,capabilities: null == capabilities ? _self._capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as List<CapabilityApiModel>,
  ));
}


}

CapabilityApiModel _$CapabilityApiModelFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'selector':
          return SelectorApiModel.fromJson(
            json
          );
                case 'gauge':
          return GaugeApiModel.fromJson(
            json
          );
                case 'toggle':
          return ToggleApiModel.fromJson(
            json
          );
                case 'slider':
          return SliderApiModel.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'CapabilityApiModel',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$CapabilityApiModel {

 String get id; String get title;
/// Create a copy of CapabilityApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CapabilityApiModelCopyWith<CapabilityApiModel> get copyWith => _$CapabilityApiModelCopyWithImpl<CapabilityApiModel>(this as CapabilityApiModel, _$identity);

  /// Serializes this CapabilityApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CapabilityApiModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CapabilityApiModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CapabilityApiModel;
  return Object.hash(runtimeType,_this.id,_this.title);
}

@override
String toString() {
  final _this = this as CapabilityApiModel;
  return 'CapabilityApiModel(id: ${_this.id}, title: ${_this.title})';
}


}

/// @nodoc
abstract mixin class $CapabilityApiModelCopyWith<$Res>  {
  factory $CapabilityApiModelCopyWith(CapabilityApiModel value, $Res Function(CapabilityApiModel) _then) = _$CapabilityApiModelCopyWithImpl;
@useResult
$Res call({
 String id, String title
});




}
/// @nodoc
class _$CapabilityApiModelCopyWithImpl<$Res>
    implements $CapabilityApiModelCopyWith<$Res> {
  _$CapabilityApiModelCopyWithImpl(this._self, this._then);

  final CapabilityApiModel _self;
  final $Res Function(CapabilityApiModel) _then;

/// Create a copy of CapabilityApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CapabilityApiModel].
extension CapabilityApiModelPatterns on CapabilityApiModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SelectorApiModel value)?  selector,TResult Function( GaugeApiModel value)?  gauge,TResult Function( ToggleApiModel value)?  toggle,TResult Function( SliderApiModel value)?  slider,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SelectorApiModel() when selector != null:
return selector(_that);case GaugeApiModel() when gauge != null:
return gauge(_that);case ToggleApiModel() when toggle != null:
return toggle(_that);case SliderApiModel() when slider != null:
return slider(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SelectorApiModel value)  selector,required TResult Function( GaugeApiModel value)  gauge,required TResult Function( ToggleApiModel value)  toggle,required TResult Function( SliderApiModel value)  slider,}){
final _that = this;
switch (_that) {
case SelectorApiModel():
return selector(_that);case GaugeApiModel():
return gauge(_that);case ToggleApiModel():
return toggle(_that);case SliderApiModel():
return slider(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SelectorApiModel value)?  selector,TResult? Function( GaugeApiModel value)?  gauge,TResult? Function( ToggleApiModel value)?  toggle,TResult? Function( SliderApiModel value)?  slider,}){
final _that = this;
switch (_that) {
case SelectorApiModel() when selector != null:
return selector(_that);case GaugeApiModel() when gauge != null:
return gauge(_that);case ToggleApiModel() when toggle != null:
return toggle(_that);case SliderApiModel() when slider != null:
return slider(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String title,  List<OptionApiModel> options,  String? selectedId)?  selector,TResult Function( String id,  String title,  double value,  double min,  double max,  String unit)?  gauge,TResult Function( String id,  String title,  bool isOn)?  toggle,TResult Function( String id,  String title,  double value,  double min,  double max,  double? step)?  slider,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SelectorApiModel() when selector != null:
return selector(_that.id,_that.title,_that.options,_that.selectedId);case GaugeApiModel() when gauge != null:
return gauge(_that.id,_that.title,_that.value,_that.min,_that.max,_that.unit);case ToggleApiModel() when toggle != null:
return toggle(_that.id,_that.title,_that.isOn);case SliderApiModel() when slider != null:
return slider(_that.id,_that.title,_that.value,_that.min,_that.max,_that.step);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String title,  List<OptionApiModel> options,  String? selectedId)  selector,required TResult Function( String id,  String title,  double value,  double min,  double max,  String unit)  gauge,required TResult Function( String id,  String title,  bool isOn)  toggle,required TResult Function( String id,  String title,  double value,  double min,  double max,  double? step)  slider,}) {final _that = this;
switch (_that) {
case SelectorApiModel():
return selector(_that.id,_that.title,_that.options,_that.selectedId);case GaugeApiModel():
return gauge(_that.id,_that.title,_that.value,_that.min,_that.max,_that.unit);case ToggleApiModel():
return toggle(_that.id,_that.title,_that.isOn);case SliderApiModel():
return slider(_that.id,_that.title,_that.value,_that.min,_that.max,_that.step);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String title,  List<OptionApiModel> options,  String? selectedId)?  selector,TResult? Function( String id,  String title,  double value,  double min,  double max,  String unit)?  gauge,TResult? Function( String id,  String title,  bool isOn)?  toggle,TResult? Function( String id,  String title,  double value,  double min,  double max,  double? step)?  slider,}) {final _that = this;
switch (_that) {
case SelectorApiModel() when selector != null:
return selector(_that.id,_that.title,_that.options,_that.selectedId);case GaugeApiModel() when gauge != null:
return gauge(_that.id,_that.title,_that.value,_that.min,_that.max,_that.unit);case ToggleApiModel() when toggle != null:
return toggle(_that.id,_that.title,_that.isOn);case SliderApiModel() when slider != null:
return slider(_that.id,_that.title,_that.value,_that.min,_that.max,_that.step);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class SelectorApiModel implements CapabilityApiModel {
  const SelectorApiModel({required this.id, required this.title, required  List<OptionApiModel> options, this.selectedId,  String? $type}): _options = options,$type = $type ?? 'selector';
  factory SelectorApiModel.fromJson(Map<String, dynamic> json) => _$SelectorApiModelFromJson(json);

@override final  String id;
@override final  String title;
 final  List<OptionApiModel> _options;
 List<OptionApiModel> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

 final  String? selectedId;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of CapabilityApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectorApiModelCopyWith<SelectorApiModel> get copyWith => _$SelectorApiModelCopyWithImpl<SelectorApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectorApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectorApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.options, _options)&&(identical(other.selectedId, selectedId) || other.selectedId == selectedId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_options),selectedId);
}

@override
String toString() {
    return 'CapabilityApiModel.selector(id: $id, title: $title, options: $options, selectedId: $selectedId)';
}


}

/// @nodoc
abstract mixin class $SelectorApiModelCopyWith<$Res> implements $CapabilityApiModelCopyWith<$Res> {
  factory $SelectorApiModelCopyWith(SelectorApiModel value, $Res Function(SelectorApiModel) _then) = _$SelectorApiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, List<OptionApiModel> options, String? selectedId
});




}
/// @nodoc
class _$SelectorApiModelCopyWithImpl<$Res>
    implements $SelectorApiModelCopyWith<$Res> {
  _$SelectorApiModelCopyWithImpl(this._self, this._then);

  final SelectorApiModel _self;
  final $Res Function(SelectorApiModel) _then;

/// Create a copy of CapabilityApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? options = null,Object? selectedId = freezed,}) {
  return _then(SelectorApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<OptionApiModel>,selectedId: freezed == selectedId ? _self.selectedId : selectedId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class GaugeApiModel implements CapabilityApiModel {
  const GaugeApiModel({required this.id, required this.title, required this.value, required this.min, required this.max, this.unit = '',  String? $type}): $type = $type ?? 'gauge';
  factory GaugeApiModel.fromJson(Map<String, dynamic> json) => _$GaugeApiModelFromJson(json);

@override final  String id;
@override final  String title;
 final  double value;
 final  double min;
 final  double max;
@JsonKey() final  String unit;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of CapabilityApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GaugeApiModelCopyWith<GaugeApiModel> get copyWith => _$GaugeApiModelCopyWithImpl<GaugeApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GaugeApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GaugeApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.value, value) || other.value == value)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,value,min,max,unit);
}

@override
String toString() {
    return 'CapabilityApiModel.gauge(id: $id, title: $title, value: $value, min: $min, max: $max, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $GaugeApiModelCopyWith<$Res> implements $CapabilityApiModelCopyWith<$Res> {
  factory $GaugeApiModelCopyWith(GaugeApiModel value, $Res Function(GaugeApiModel) _then) = _$GaugeApiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, double value, double min, double max, String unit
});




}
/// @nodoc
class _$GaugeApiModelCopyWithImpl<$Res>
    implements $GaugeApiModelCopyWith<$Res> {
  _$GaugeApiModelCopyWithImpl(this._self, this._then);

  final GaugeApiModel _self;
  final $Res Function(GaugeApiModel) _then;

/// Create a copy of CapabilityApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? value = null,Object? min = null,Object? max = null,Object? unit = null,}) {
  return _then(GaugeApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ToggleApiModel implements CapabilityApiModel {
  const ToggleApiModel({required this.id, required this.title, required this.isOn,  String? $type}): $type = $type ?? 'toggle';
  factory ToggleApiModel.fromJson(Map<String, dynamic> json) => _$ToggleApiModelFromJson(json);

@override final  String id;
@override final  String title;
 final  bool isOn;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of CapabilityApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleApiModelCopyWith<ToggleApiModel> get copyWith => _$ToggleApiModelCopyWithImpl<ToggleApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToggleApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isOn, isOn) || other.isOn == isOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,isOn);
}

@override
String toString() {
    return 'CapabilityApiModel.toggle(id: $id, title: $title, isOn: $isOn)';
}


}

/// @nodoc
abstract mixin class $ToggleApiModelCopyWith<$Res> implements $CapabilityApiModelCopyWith<$Res> {
  factory $ToggleApiModelCopyWith(ToggleApiModel value, $Res Function(ToggleApiModel) _then) = _$ToggleApiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, bool isOn
});




}
/// @nodoc
class _$ToggleApiModelCopyWithImpl<$Res>
    implements $ToggleApiModelCopyWith<$Res> {
  _$ToggleApiModelCopyWithImpl(this._self, this._then);

  final ToggleApiModel _self;
  final $Res Function(ToggleApiModel) _then;

/// Create a copy of CapabilityApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isOn = null,}) {
  return _then(ToggleApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isOn: null == isOn ? _self.isOn : isOn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SliderApiModel implements CapabilityApiModel {
  const SliderApiModel({required this.id, required this.title, required this.value, required this.min, required this.max, this.step,  String? $type}): $type = $type ?? 'slider';
  factory SliderApiModel.fromJson(Map<String, dynamic> json) => _$SliderApiModelFromJson(json);

@override final  String id;
@override final  String title;
 final  double value;
 final  double min;
 final  double max;
 final  double? step;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of CapabilityApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SliderApiModelCopyWith<SliderApiModel> get copyWith => _$SliderApiModelCopyWithImpl<SliderApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SliderApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SliderApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.value, value) || other.value == value)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.step, step) || other.step == step));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,value,min,max,step);
}

@override
String toString() {
    return 'CapabilityApiModel.slider(id: $id, title: $title, value: $value, min: $min, max: $max, step: $step)';
}


}

/// @nodoc
abstract mixin class $SliderApiModelCopyWith<$Res> implements $CapabilityApiModelCopyWith<$Res> {
  factory $SliderApiModelCopyWith(SliderApiModel value, $Res Function(SliderApiModel) _then) = _$SliderApiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, double value, double min, double max, double? step
});




}
/// @nodoc
class _$SliderApiModelCopyWithImpl<$Res>
    implements $SliderApiModelCopyWith<$Res> {
  _$SliderApiModelCopyWithImpl(this._self, this._then);

  final SliderApiModel _self;
  final $Res Function(SliderApiModel) _then;

/// Create a copy of CapabilityApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? value = null,Object? min = null,Object? max = null,Object? step = freezed,}) {
  return _then(SliderApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double,step: freezed == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$OptionApiModel {

 String get id; String get title; bool get hidden;
/// Create a copy of OptionApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptionApiModelCopyWith<OptionApiModel> get copyWith => _$OptionApiModelCopyWithImpl<OptionApiModel>(this as OptionApiModel, _$identity);

  /// Serializes this OptionApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OptionApiModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OptionApiModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.hidden, _this.hidden) || other.hidden == _this.hidden));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OptionApiModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.hidden);
}

@override
String toString() {
  final _this = this as OptionApiModel;
  return 'OptionApiModel(id: ${_this.id}, title: ${_this.title}, hidden: ${_this.hidden})';
}


}

/// @nodoc
abstract mixin class $OptionApiModelCopyWith<$Res>  {
  factory $OptionApiModelCopyWith(OptionApiModel value, $Res Function(OptionApiModel) _then) = _$OptionApiModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, bool hidden
});




}
/// @nodoc
class _$OptionApiModelCopyWithImpl<$Res>
    implements $OptionApiModelCopyWith<$Res> {
  _$OptionApiModelCopyWithImpl(this._self, this._then);

  final OptionApiModel _self;
  final $Res Function(OptionApiModel) _then;

/// Create a copy of OptionApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? hidden = null,}) {
  return _then(OptionApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,hidden: null == hidden ? _self.hidden : hidden // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OptionApiModel].
extension OptionApiModelPatterns on OptionApiModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OptionApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OptionApiModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OptionApiModel value)  $default,){
final _that = this;
switch (_that) {
case _OptionApiModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OptionApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _OptionApiModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  bool hidden)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OptionApiModel() when $default != null:
return $default(_that.id,_that.title,_that.hidden);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  bool hidden)  $default,) {final _that = this;
switch (_that) {
case _OptionApiModel():
return $default(_that.id,_that.title,_that.hidden);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  bool hidden)?  $default,) {final _that = this;
switch (_that) {
case _OptionApiModel() when $default != null:
return $default(_that.id,_that.title,_that.hidden);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OptionApiModel implements OptionApiModel {
  const _OptionApiModel({required this.id, required this.title, this.hidden = false});
  factory _OptionApiModel.fromJson(Map<String, dynamic> json) => _$OptionApiModelFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey() final  bool hidden;

/// Create a copy of OptionApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptionApiModelCopyWith<_OptionApiModel> get copyWith => __$OptionApiModelCopyWithImpl<_OptionApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OptionApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OptionApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.hidden, hidden) || other.hidden == hidden));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,hidden);
}

@override
String toString() {
    return 'OptionApiModel(id: $id, title: $title, hidden: $hidden)';
}


}

/// @nodoc
abstract mixin class _$OptionApiModelCopyWith<$Res> implements $OptionApiModelCopyWith<$Res> {
  factory _$OptionApiModelCopyWith(_OptionApiModel value, $Res Function(_OptionApiModel) _then) = __$OptionApiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, bool hidden
});




}
/// @nodoc
class __$OptionApiModelCopyWithImpl<$Res>
    implements _$OptionApiModelCopyWith<$Res> {
  __$OptionApiModelCopyWithImpl(this._self, this._then);

  final _OptionApiModel _self;
  final $Res Function(_OptionApiModel) _then;

/// Create a copy of OptionApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? hidden = null,}) {
  return _then(_OptionApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,hidden: null == hidden ? _self.hidden : hidden // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

CommandApiModel _$CommandApiModelFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'select':
          return SelectCommandApiModel.fromJson(
            json
          );
                case 'toggle':
          return ToggleCommandApiModel.fromJson(
            json
          );
                case 'value':
          return ValueCommandApiModel.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'CommandApiModel',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$CommandApiModel {



  /// Serializes this CommandApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandApiModel);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CommandApiModel()';
}


}

/// @nodoc
class $CommandApiModelCopyWith<$Res>  {
$CommandApiModelCopyWith(CommandApiModel _, $Res Function(CommandApiModel) __);
}


/// Adds pattern-matching-related methods to [CommandApiModel].
extension CommandApiModelPatterns on CommandApiModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SelectCommandApiModel value)?  select,TResult Function( ToggleCommandApiModel value)?  toggle,TResult Function( ValueCommandApiModel value)?  value,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SelectCommandApiModel() when select != null:
return select(_that);case ToggleCommandApiModel() when toggle != null:
return toggle(_that);case ValueCommandApiModel() when value != null:
return value(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SelectCommandApiModel value)  select,required TResult Function( ToggleCommandApiModel value)  toggle,required TResult Function( ValueCommandApiModel value)  value,}){
final _that = this;
switch (_that) {
case SelectCommandApiModel():
return select(_that);case ToggleCommandApiModel():
return toggle(_that);case ValueCommandApiModel():
return value(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SelectCommandApiModel value)?  select,TResult? Function( ToggleCommandApiModel value)?  toggle,TResult? Function( ValueCommandApiModel value)?  value,}){
final _that = this;
switch (_that) {
case SelectCommandApiModel() when select != null:
return select(_that);case ToggleCommandApiModel() when toggle != null:
return toggle(_that);case ValueCommandApiModel() when value != null:
return value(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String optionId)?  select,TResult Function( bool isOn)?  toggle,TResult Function( double value)?  value,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SelectCommandApiModel() when select != null:
return select(_that.optionId);case ToggleCommandApiModel() when toggle != null:
return toggle(_that.isOn);case ValueCommandApiModel() when value != null:
return value(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String optionId)  select,required TResult Function( bool isOn)  toggle,required TResult Function( double value)  value,}) {final _that = this;
switch (_that) {
case SelectCommandApiModel():
return select(_that.optionId);case ToggleCommandApiModel():
return toggle(_that.isOn);case ValueCommandApiModel():
return value(_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String optionId)?  select,TResult? Function( bool isOn)?  toggle,TResult? Function( double value)?  value,}) {final _that = this;
switch (_that) {
case SelectCommandApiModel() when select != null:
return select(_that.optionId);case ToggleCommandApiModel() when toggle != null:
return toggle(_that.isOn);case ValueCommandApiModel() when value != null:
return value(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class SelectCommandApiModel implements CommandApiModel {
  const SelectCommandApiModel({required this.optionId,  String? $type}): $type = $type ?? 'select';
  factory SelectCommandApiModel.fromJson(Map<String, dynamic> json) => _$SelectCommandApiModelFromJson(json);

 final  String optionId;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of CommandApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectCommandApiModelCopyWith<SelectCommandApiModel> get copyWith => _$SelectCommandApiModelCopyWithImpl<SelectCommandApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectCommandApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectCommandApiModel&&(identical(other.optionId, optionId) || other.optionId == optionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,optionId);
}

@override
String toString() {
    return 'CommandApiModel.select(optionId: $optionId)';
}


}

/// @nodoc
abstract mixin class $SelectCommandApiModelCopyWith<$Res> implements $CommandApiModelCopyWith<$Res> {
  factory $SelectCommandApiModelCopyWith(SelectCommandApiModel value, $Res Function(SelectCommandApiModel) _then) = _$SelectCommandApiModelCopyWithImpl;
@useResult
$Res call({
 String optionId
});




}
/// @nodoc
class _$SelectCommandApiModelCopyWithImpl<$Res>
    implements $SelectCommandApiModelCopyWith<$Res> {
  _$SelectCommandApiModelCopyWithImpl(this._self, this._then);

  final SelectCommandApiModel _self;
  final $Res Function(SelectCommandApiModel) _then;

/// Create a copy of CommandApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? optionId = null,}) {
  return _then(SelectCommandApiModel(
optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ToggleCommandApiModel implements CommandApiModel {
  const ToggleCommandApiModel({required this.isOn,  String? $type}): $type = $type ?? 'toggle';
  factory ToggleCommandApiModel.fromJson(Map<String, dynamic> json) => _$ToggleCommandApiModelFromJson(json);

 final  bool isOn;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of CommandApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleCommandApiModelCopyWith<ToggleCommandApiModel> get copyWith => _$ToggleCommandApiModelCopyWithImpl<ToggleCommandApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToggleCommandApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleCommandApiModel&&(identical(other.isOn, isOn) || other.isOn == isOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,isOn);
}

@override
String toString() {
    return 'CommandApiModel.toggle(isOn: $isOn)';
}


}

/// @nodoc
abstract mixin class $ToggleCommandApiModelCopyWith<$Res> implements $CommandApiModelCopyWith<$Res> {
  factory $ToggleCommandApiModelCopyWith(ToggleCommandApiModel value, $Res Function(ToggleCommandApiModel) _then) = _$ToggleCommandApiModelCopyWithImpl;
@useResult
$Res call({
 bool isOn
});




}
/// @nodoc
class _$ToggleCommandApiModelCopyWithImpl<$Res>
    implements $ToggleCommandApiModelCopyWith<$Res> {
  _$ToggleCommandApiModelCopyWithImpl(this._self, this._then);

  final ToggleCommandApiModel _self;
  final $Res Function(ToggleCommandApiModel) _then;

/// Create a copy of CommandApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isOn = null,}) {
  return _then(ToggleCommandApiModel(
isOn: null == isOn ? _self.isOn : isOn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ValueCommandApiModel implements CommandApiModel {
  const ValueCommandApiModel({required this.value,  String? $type}): $type = $type ?? 'value';
  factory ValueCommandApiModel.fromJson(Map<String, dynamic> json) => _$ValueCommandApiModelFromJson(json);

 final  double value;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of CommandApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValueCommandApiModelCopyWith<ValueCommandApiModel> get copyWith => _$ValueCommandApiModelCopyWithImpl<ValueCommandApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ValueCommandApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ValueCommandApiModel&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,value);
}

@override
String toString() {
    return 'CommandApiModel.value(value: $value)';
}


}

/// @nodoc
abstract mixin class $ValueCommandApiModelCopyWith<$Res> implements $CommandApiModelCopyWith<$Res> {
  factory $ValueCommandApiModelCopyWith(ValueCommandApiModel value, $Res Function(ValueCommandApiModel) _then) = _$ValueCommandApiModelCopyWithImpl;
@useResult
$Res call({
 double value
});




}
/// @nodoc
class _$ValueCommandApiModelCopyWithImpl<$Res>
    implements $ValueCommandApiModelCopyWith<$Res> {
  _$ValueCommandApiModelCopyWithImpl(this._self, this._then);

  final ValueCommandApiModel _self;
  final $Res Function(ValueCommandApiModel) _then;

/// Create a copy of CommandApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ValueCommandApiModel(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
