import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameTextFieldController = Provider((_) => TextEditingController());

final qrCodeDataProvider = StateProvider((ref) => '');

final xRouteProvider = StateProvider<double>((ref) => 0);

final zRouteProvider = StateProvider<double>((ref) => 0);