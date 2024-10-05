
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'other_provider.g.dart';

@Riverpod(dependencies: [])
String getAppName(GetAppNameRef ref) => 'Design Patterns';