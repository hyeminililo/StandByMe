import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';

const ACESS_TOKEN_KEY = 'ACESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';

const storage = FlutterSecureStorage();

const emulatorIP = '10.0.2.2:3000';
const simulatorIP = '127.0.2.2:3000';

final ip = Platform.isIOS ? simulatorIP : emulatorIP;
