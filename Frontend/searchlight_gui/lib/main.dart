import 'dart:io';
//import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
// import 'package:flutter_window_close/flutter_window_close.dart';
// import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
// import 'package:flutter_window_close/flutter_window_close.dart' as fwc;

//import 'bg.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hotKeyManager.unregisterAll();
  HotKey _hotKey = HotKey(
    KeyCode.keyZ,
    modifiers: [KeyModifier.alt],
    //-------- Set hotkey scope (default is HotKeyScope.system)--------
    //scope: HotKeyScope.inapp, //------- Set as inapp-wide hotkey-------
  );
  await hotKeyManager.register(
    _hotKey,
    keyDownHandler: (hotKey) {
      // if (appWindow.isVisible) {
      //   // print('Already Visible');
      // } else {
      //   appWindow.show();
      // }
    },
    //----- Only works on macOS --------
    //keyUpHandler: (hotKey){
    //print('onKeyUp+${hotKey.toJson()}');
    //} ,
    //----------------------------------
  );

  await Window.initialize();
  if (Platform.isWindows) {
    await Window.setEffect(
      effect: WindowEffect.transparent,
      //color: Color(0xCC222222),
    );
    //--------<>-------------
    //Enable when in Production
    //--------<>--------------
    // Window.enterFullscreen();
  }
  runApp(const MyApp());
  // focus
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
          accentColor: fluent_ui.Colors.blue,
          //works with ScaffoldPage
          scaffoldBackgroundColor: fluent_ui.Colors.transparent),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  var systemTempDir =
      Directory(Platform.environment['USERPROFILE'].toString() + '/Downloads');

  get contents =>
      systemTempDir.listSync(recursive: true).map((e) => e.toString()).toList();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      //------------- Base Layout Of App --------------
      backgroundColor: fluent_ui.Colors.transparent,

      //<Previous Code >bottomNavigationBar: ,
      body: fluent_ui.Column(
          mainAxisAlignment: fluent_ui.MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 0,
                child: fluent_ui.Center(
                    child: fluent_ui.Container(

                        //<For Coulmn/Row as super> mainAxisAlignment: fluent_ui.MainAxisAlignment.center,
                        child: fluent_ui.Center(
                            child: fluent_ui.FractionallySizedBox(
                                widthFactor: 0.30,
                                //<For Coulmn/Row as super> mainAxisAlignment: fluent_ui.MainAxisAlignment.center,
                                child: fluent_ui.AutoSuggestBox(
                                  leadingIcon: fluent_ui.Icon(
                                      fluent_ui.FluentIcons.search),
                                  placeholder: 'Search',
                                  items: contents,
                                  onChanged: (text, reason) async {
                                    var re = RegExp(
                                        r"File: '(([A-Z]:)?[\.]?[\\{1,2}/]?.*[\\{1,2}/])*(.+)\.(.+)'");

                                    if (re.hasMatch('$text')) {
                                      String txt = text
                                          .replaceFirst('File: ', '')
                                          .replaceAll("'", "");
                                      print(txt);
                                      if (Platform.isLinux) {
                                        await Process.run("xdg-open", [
                                          txt,
                                        ]);
                                        // appWindow.hide();
                                      } else if (Platform.isWindows) {
                                        // appWindow.hide();
                                        await Process.run(txt, [],
                                            runInShell: true);
                                      }
                                    } else {
                                      print('No Match');
                                    }
                                  },
                                  onSelected: (breed) {
                                    // print(breed);
                                  },
                                )))))),
          ]),
    );
  }
}
