// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Source {

 String get id; String get name; String get host; int get port;
/// Create a copy of Source
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceCopyWith<Source> get copyWith => _$SourceCopyWithImpl<Source>(this as Source, _$identity);

  /// Serializes this Source to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Source;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Source&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.host, _this.host) || other.host == _this.host)&&(identical(other.port, _this.port) || other.port == _this.port));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Source;
  return Object.hash(runtimeType,_this.id,_this.name,_this.host,_this.port);
}

@override
String toString() {
  final _this = this as Source;
  return 'Source(id: ${_this.id}, name: ${_this.name}, host: ${_this.host}, port: ${_this.port})';
}


}

/// @nodoc
abstract mixin class $SourceCopyWith<$Res>  {
  factory $SourceCopyWith(Source value, $Res Function(Source) _then) = _$SourceCopyWithImpl;
@useResult
$Res call({
 String id, String name, String host, int port
});




}
/// @nodoc
class _$SourceCopyWithImpl<$Res>
    implements $SourceCopyWith<$Res> {
  _$SourceCopyWithImpl(this._self, this._then);

  final Source _self;
  final $Res Function(Source) _then;

/// Create a copy of Source
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? host = null,Object? port = null,}) {
  return _then(Source(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Source].
extension SourcePatterns on Source {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Source value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Source() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Source value)  $default,){
final _that = this;
switch (_that) {
case _Source():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Source value)?  $default,){
final _that = this;
switch (_that) {
case _Source() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String host,  int port)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Source() when $default != null:
return $default(_that.id,_that.name,_that.host,_that.port);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String host,  int port)  $default,) {final _that = this;
switch (_that) {
case _Source():
return $default(_that.id,_that.name,_that.host,_that.port);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String host,  int port)?  $default,) {final _that = this;
switch (_that) {
case _Source() when $default != null:
return $default(_that.id,_that.name,_that.host,_that.port);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Source implements Source {
  const _Source({required this.id, required this.name, required this.host, required this.port});
  factory _Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

@override final  String id;
@override final  String name;
@override final  String host;
@override final  int port;

/// Create a copy of Source
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceCopyWith<_Source> get copyWith => __$SourceCopyWithImpl<_Source>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SourceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Source&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.host, host) || other.host == host)&&(identical(other.port, port) || other.port == port));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,host,port);
}

@override
String toString() {
    return 'Source(id: $id, name: $name, host: $host, port: $port)';
}


}

/// @nodoc
abstract mixin class _$SourceCopyWith<$Res> implements $SourceCopyWith<$Res> {
  factory _$SourceCopyWith(_Source value, $Res Function(_Source) _then) = __$SourceCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String host, int port
});




}
/// @nodoc
class __$SourceCopyWithImpl<$Res>
    implements _$SourceCopyWith<$Res> {
  __$SourceCopyWithImpl(this._self, this._then);

  final _Source _self;
  final $Res Function(_Source) _then;

/// Create a copy of Source
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? host = null,Object? port = null,}) {
  return _then(_Source(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
