import 'dart:io';
//import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:flutter_window_close/flutter_window_close.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:flutter_window_close/flutter_window_close.dart' as fwc;

//import 'bg.dart';
int index = 1;
int _currentIndex = 0;
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
      if (appWindow.isVisible) {
        //appWindow.hide();
        print('Already Visible');
      } else {
        appWindow.show();
        // material.NextFocusAction();
        //  NextFocusAction();

        print('Not Visible');
      }
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
    Window.enterFullscreen();
  }

  runApp(MyApp());
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
          accentColor: fluent_ui.Colors.blue,
          //works with ScaffoldPage
          scaffoldBackgroundColor: fluent_ui.Colors.transparent),
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
  int _counter = 0;
  var _alertShowing = false;
  var _index = 0;
  var systemTempDir =
      Directory(Platform.environment['USERPROFILE'].toString() + '/Downloads');

  get contents => systemTempDir
      .listSync(recursive: true)
      .map((e) => e.toString().replaceAll('/', '\\'))
      .toList();

  material.FocusNode focusNode = material.FocusNode();
  get focusnode => focusNode;

  @override
  void initState() {
    super.initState();
    // var systemTempDir = Directory('C:/Users/asus/');
    // List contents = systemTempDir.listSync();
    // contents.forEach((element) {
    //   print(element.path);
    // });
    // print(Platform.environment['USERPROFILE'].toString());
    FlutterWindowClose.setWindowShouldCloseHandler(() async {
      appWindow.hide();
      return false;
    });
    focusNode.requestFocus();
  }

  static const cursorState = SystemMouseCursors.click;
  cursorF() {
    appWindow.hide();
    // var duration = const Duration(seconds: 5);
    // print('Start sleeping');
    // sleep(duration);
    // print('5 seconds has passed');
    appWindow.show();
    const cursorState = SystemMouseCursors.grab;
    return cursorState;
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    focusNode.requestFocus();

    return Scaffold(
      //------------- Base Layout Of App --------------
      backgroundColor: fluent_ui.Colors.transparent,

      //<Previous Code >bottomNavigationBar: ,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // your code
          print('tap');
        },
        //------------------For Future Use -----------------------
        //onDoubleTapDown:(details) {

        //   //print(details.localPosition);
        //   //Direction ;
        //   const da =fluent_ui.Offset(477.0,273.0);
        //   const db =fluent_ui.Offset(477.0,494.0);
        //   const dx =fluent_ui.Offset(888.0,273.0);
        //   const dy =fluent_ui.Offset(888.0,494.0);
        //   bool insideRect(double x, double y) =>
        //   x >= da.dx && x <= da.dx + 411 && y >= da.dy && y <= da.dy + 221;
        //   bool br=insideRect(details.localPosition.dx, details.localPosition.dy);
        //   if(br){
        //     //print('inside object');
        //   }else{
        //     //print('outside object');
        //     //print(_counter);
        //     appWindow.show();
        //   }
        // },
        // ---------------------------------------------------------------------------
        onTapUp: (details) {
          // Process.run('python', ['-V']).then((ProcessResult pr) {
          //   print(pr.exitCode);
          //   print(pr.stdout);
          //   print(pr.stderr);
          // });
          // print(details.localPosition);
          //Direction ;
          const da = fluent_ui.Offset(446.0, 252.0);
          const dk = fluent_ui.Offset(477.0, 273.0);
          const db = fluent_ui.Offset(477.0, 494.0);
          const dx = fluent_ui.Offset(888.0, 273.0);
          const dy = fluent_ui.Offset(888.0, 494.0);
          bool insideRect(double x, double y) =>
              x >= da.dx && x <= da.dx + 387 && y >= da.dy && y <= da.dy + 211;
          bool br =
              insideRect(details.localPosition.dx, details.localPosition.dy);
          if (br) {
            //---<For Testing>-------
            //print('inside object');
            //---</>-------

          } else {
            //---<For Testing>-------
            //print('outside object');
            //print(_counter);
            //-----</>---------------
            appWindow.hide();
          }
        },
        child: RawKeyboardListener(
            focusNode: material.FocusNode(),
            onKey: (material.RawKeyEvent event) {
              print(event.data.logicalKey.keyLabel);
              if (event.data.isControlPressed) {
                if (event.data.isShiftPressed) {
                  if (event.data.logicalKey.keyLabel == 'N') {
                    print('New Window');
                    appWindow.hide();
                  }
                }
              }
            },
            child: fluent_ui.Column(
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
                                      child: Focus(
                                          autofocus: true,
                                          focusNode: focusNode,
                                          canRequestFocus: true,
                                          child: AutoSuggestBox(
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
                                                  await Process.run(
                                                      "xdg-open", [
                                                    txt,
                                                  ]);
                                                  appWindow.hide();
                                                } else if (Platform.isWindows) {
                                                  appWindow.hide();
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
                                          ))))))),
//  ---- dUMP OlD Code ----
                  // Expanded(
                  //     flex: 0,
                  // child: fluent_ui.Container(
                  //     child: fluent_ui.FractionallySizedBox(
                  //         widthFactor: 0.30,
                  //         child: Container(
                  //             decoration: BoxDecoration(
                  //                 color: fluent_ui.Colors.white,
                  //                 border: Border.all(
                  //                   color: fluent_ui.Colors.white,
                  //                 ),
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(5))),
                  //             child: fluent_ui.Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   PageHeader(
                  //                       title: fluent_ui.Text(
                  //                         'Recent',
                  //                         textScaleFactor: 0.5,
                  //                       ),
                  //                       commandBar: DropDownButton(
                  //                         leading: const Icon(
                  //                           FluentIcons.sort,
                  //                           size: 16.0,
                  //                         ),
                  //                         title: const Text(
                  //                           'Sort By',
                  //                           textScaleFactor: 0.7,
                  //                         ),
                  //                         items: [
                  //                           MenuFlyoutItem(
                  //                             text: const Text('Last 24H'),
                  //                             leading: const Icon(
                  //                               FluentIcons.calendar_day,
                  //                               size: 16.0,
                  //                             ),
                  //                             onPressed: () =>
                  //                                 debugPrint('left'),
                  //                           ),
                  //                           MenuFlyoutItem(
                  //                             text: const Text('Last Week'),
                  //                             leading: const Icon(
                  //                                 FluentIcons
                  //                                     .calendar_week),
                  //                             onPressed: () =>
                  //                                 debugPrint('center'),
                  //                           ),
                  //                           MenuFlyoutItem(
                  //                             text:
                  //                                 const Text('Last Month'),
                  //                             leading: const Icon(
                  //                                 FluentIcons
                  //                                     .calendar_year),
                  //                             onPressed: () =>
                  //                                 debugPrint('right'),
                  //                           ),
                  //                         ],
                  //                       )),
                  // new GestureDetector(
                  //   onTap: () =>
                  //       debugPrint('option 1 addressed'),
                  //   // child:
                  //   //  fluent_ui.Text(
                  //   //     'Assignment.pdf')
                  // ),
                  // fluent_ui.Text(
                  //     '20BCE10373_Tutorial.pdf'),
                  // fluent_ui.Text('New_Document.docx'),
                  // fluent_ui.Text('TEXT BUTTON'),
                  //  fluent_ui.Text('TEXT BUTTON'),
                  // fluent_ui.BottomNavigation(
                  //   index: index,
                  //   onChanged: (i) =>
                  //       setState(() => index = i),
                  //   items: const [
                  //     BottomNavigationItem(
                  //       icon:
                  //           Icon(Icons.document_scanner),
                  //       selectedIcon:
                  //           Icon(Icons.document_scanner),
                  //       title: Text('Docs'),
                  //     ),
                  //     BottomNavigationItem(
                  //       icon: Icon(Icons.image),
                  //       selectedIcon: Icon(Icons.image),
                  //       title: Text('Images'),
                  //     ),
                  //     BottomNavigationItem(
                  //       icon:
                  //           Icon(Icons.note_alt_rounded),
                  //       selectedIcon:
                  //           Icon(Icons.note_alt_outlined),
                  //       title: Text('Notes'),
                  //     ),
                  //   ],
                  // )
                  // ]))
                  // ))
                  // ),
                  // ---- END-----
                ])),
      ),
      extendBody: false,
    );
  }
}
