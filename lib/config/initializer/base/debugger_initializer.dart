/*
 * @Description: debug调试
 * @Author: iamsmiling
 * @Date: 2021-09-18 14:21:17
 * @LastEditTime: 2021-09-23 09:20:52
 */
import 'package:flutter/foundation.dart';
import 'package:flutter_ume/flutter_ume.dart';
import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart';
import 'package:flutter_ume_kit_perf/components/performance/performance.dart';
import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart';
import 'package:flutter_ume_kit_show_code/show_code/show_code.dart';
import 'package:flutter_ume_kit_ui/flutter_ume_kit_ui.dart';
import 'package:flutter_ume_kit_dio/flutter_ume_kit_dio.dart';
import 'package:ty_flutter_cli/config/env/app_environment.dart';
import 'package:ty_flutter_cli/http/http.dart';

import 'base_initializer.dart';

class DebuggerInitializer extends BaseInitilizer {
  @override
  Future initialize(AppEnvironment env) async {
    if (!kDebugMode) return;
    PluginManager.instance // 注册插件
          ..register(const WidgetInfoInspector())
          ..register(const WidgetDetailInspector())
          ..register(DioInspector(dio: Http.instance.dio))
          ..register(const ColorSucker())
          ..register(AlignRuler())
          ..register(Performance())
          ..register(const ShowCode())
          ..register(const MemoryInfoPage())
          ..register(CpuInfoPage())
          ..register(const DeviceInfoPanel())

        // ..register(Console())

        ;
  }
}
