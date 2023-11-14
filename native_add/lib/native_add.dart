import 'native_add_platform_interface.dart';
import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform.isX

class NativeAdd {
  static String platformVersion = '1.0';

  //函数声明
  late final int Function(int x, int y) funcAdd;

  //初始化
  NativeAdd() {
    final DynamicLibrary myNativeLib = Platform.isAndroid
        ? DynamicLibrary.open('libnative_add.so')
        : DynamicLibrary.process();
    //静态链接中的符号可以使用 DynamicLibrary.executable
    //或 DynamicLibrary.process 来加载。
    //动态链接库在 Dart 中可以通过 DynamicLibrary.open 加载。

    //函数定义
    funcAdd = myNativeLib
        .lookup<NativeFunction<Int32 Function(Int32, Int32)>>('native_add')
        .asFunction();
  }

  //给外部app调用的 对象方法
  int calc(int a, int b) {
    int n = funcAdd(a, b);
    print('funcAdd($a, $b) = $n');
    return n;
  }

  //给外部app调用的 静态方法
  static String getVersion() {
    return platformVersion;
  }
}
