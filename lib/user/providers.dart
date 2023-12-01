import 'package:flutter_application_1/core/network/api.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

final clientProvider = Provider<ApiClient>((_) => ApiClient(http.Client()));
