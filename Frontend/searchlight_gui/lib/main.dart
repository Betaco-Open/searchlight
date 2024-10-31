import 'dart:io';
//import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
// import 'package:flutter_window_close/flutter_window_close.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
// import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:window_manager/window_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:macos_ui/macos_ui.dart' as macos_ui;

// import 'package:flutter_window_close/flutter_window_close.dart' as fwc;

//import 'bg.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await hotKeyManager.unregisterAll();
  // HotKey _hotKey = HotKey(
  //   KeyCode.keyZ,
  //   modifiers: [KeyModifier.alt],

  //   //-------- Set hotkey scope (default is HotKeyScope.system)--------
  //   scope: HotKeyScope.inapp, //------- Set as inapp-wide hotkey-------
  // );
  // await hotKeyManager.register(
  //   _hotKey,
  //   keyDownHandler: (hotKey) {
  //   //--------<>-------------
  //   //Enable when in Production
  //   //--------<>--------------
  //     if (appWindow.isVisible) {
  //       exit(0);
  //     } else {
  //       appWindow.show();
  //     }
  //   },
    //----- Only works on macOS --------
    //keyUpHandler: (hotKey){
    //print('onKeyUp+${hotKey.toJson()}');
    //} ,
    //----------------------------------
  // );

  await Window.initialize();
  if (Platform.isWindows) {
    await Window.setEffect(
      effect: WindowEffect.transparent,
      //color: Color(0xCC222222),
    );
    //--------<>-------------
    //Enable when in Production
    //--------<>--------------
    Window.enterFullscreen();
  }
  if( Platform.isLinux){
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.

  await windowManager.ensureInitialized();
    // Window.enterFullscreen();

  await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
  await windowManager.setAsFrameless();
  await windowManager.maximize();


  // windowManager.waitUntilReadyToShow(windowOptions, () async {
  //   await windowManager.show();
  //   await windowManager.focus();
  // });
  //     windowManager.waitUntilReadyToShow().then((_) async{
  //     await windowManager.setAsFrameless();
  // });

  }
  if(Platform.isMacOS){
    print('Build Type: MacOS');
    // final Directory tempDir = await getTemporaryDirectory();

    // final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

    final Directory? downloadsDir = await getDownloadsDirectory();
    var normalTempDir = Directory('./Downloads');

    // List<String>? contents = downloadsDir?.listSync(recursive: false).map((e) => e.toString()).toList();
    // if(contents!=null){
    // contents.forEach((element) {
    //   print(element);
    // });
    // }
  }
  runApp(const MyApp());
  // focus
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var systemTempDir = Directory('C:/Users/asus/');
    // List contents = systemTempDir.listSync();
    // // contents.forEach((element) {
    // //   print(element.path);
    // // });

    // print(Platform.environment['USERPROFILE'].toString());
    return fluent_ui.FluentApp(
      title: 'Flutter Demo',
      theme: fluent_ui.ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // accentColor: fluent_ui.Colors.blue,
          //works with ScaffoldPage
          // scaffoldBackgroundColor: fluent_ui.Colors.black
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Directory? systemTempDir = Directory('.');
  // get contents =>
  //     systemTempDir.listSync(recursive: false).map((e) => e.toString()).toList();
      final FocusNode _focusNode = FocusNode();
  // Directory? downloadsDir;
//      Directory((Platform.environment['HOME'] ?? Platform.environment['USERPROFILE']).toString() + '/Downloads');

Future<void> _fetchData() async {

 Directory? downloadsDir = await getDownloadsDirectory();
 systemTempDir  = Directory('/Users/vednig/Downloads');
  // List<String>? contents = downloadsDir?.listSync(recursive: true).map((e) => e.toString()).toList();
  // if(contents!=null){
  // contents.forEach((element) {
  //   print(element);
  // });
  // }
}

// List<String>? contents = downloadsDir?.listSync(recursive: false).map((e) => e.toString()).toList();
        get contents => systemTempDir?.listSync(recursive: false).map((e) => macos_ui.SearchResultItem(e.toString())).toList();


  @override
  void initState() {
    super.initState();
    _fetchData();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => FocusScope.of(context).requestFocus(_focusNode));

    // FlutterWindowClose.setWindowShouldCloseHandler(() async {
    //   appWindow.hide();
    //   return false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // focusNode.requestFocus();

    return Scaffold(
      //------------- Base Layout Of App --------------
      backgroundColor:fluent_ui.Colors.black,

      //<Previous Code >bottomNavigationBar: ,
      body: fluent_ui.Column(
          mainAxisAlignment: fluent_ui.MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 0,
                child: fluent_ui.Center(
                    child: fluent_ui.Container(
                      decoration: BoxDecoration(
                              color: fluent_ui.Colors.black,
                              borderRadius: BorderRadius.circular(4.0),
                            ),

                        //<For Coulmn/Row as super> mainAxisAlignment: fluent_ui.MainAxisAlignment.center,
                        child: fluent_ui.Center(

                            child:
                                //<For Coulmn/Row as super> mainAxisAlignment: fluent_ui.MainAxisAlignment.center,
                                 macos_ui.MacosTheme(
                                  // themeMode: ThemeMode.system, // or ThemeMode.light, ThemeMode.dark
                                  data:macos_ui.MacosThemeData.light(),

                                    child:macos_ui.MacosSearchField(

                                  placeholder: 'Search',
                                  results: contents,
                                  // onChanged: (text, reason) async {
                                  //   print(reason);
                                  //   var re = RegExp(
                                  //       r"File: '(([A-Z]:)?[\.]?[\\{1,2}/]?.*[\\{1,2}/])*(.+)\.(.+)'");
                                  //   // appWindow.hide();
                                  // print("Opening $text");
                                  //   await Process.run("open", [
                                  //     "$text",
                                  //   ]);
                                  //   if (re.hasMatch('$text')) {
                                  //     String txt = text
                                  //         .replaceFirst('File: ', '')
                                  //         .replaceAll("'", "");
                                  //     print(txt);
                                  //     if (Platform.isLinux) {
                                  //       appWindow.hide();
                                  //       await Process.run("xdg-open", [
                                  //         txt,
                                  //       ]);
                                  //       exit(0);;

                                  //     } else if (Platform.isWindows) {
                                  //       appWindow.hide();
                                  //       await Process.run(txt, [],
                                  //           runInShell: true);
                                  //     }

                                  //   } else {
                                  //     print('No Match');
                                  //   }


                                  // },
                                  // onSelected: (String selection) {
                                  //               debugPrint('$selection selected');
                                  //             },
                                  onResultSelected: (resultItem) {
                                    debugPrint(resultItem.searchKey);
                                  },


                                )

                            )
                        )

                    )
                )
            ),
          ]),
    );
  }
}
