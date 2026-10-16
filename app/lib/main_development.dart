import 'package:control_hub/app/config/dependencies.dart';
import 'package:control_hub/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(ProviderScope(overrides: overridesDevelopment, child: const MyApp()));
