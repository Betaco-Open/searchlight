import 'dart:io';
//import 'dart:ui';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
int index = 0;
int _currentIndex = 0;
void run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  await Window.setEffect(
  effect: WindowEffect.aero,
  //color: Color(0xCC222222),
);
  //appWindow.tit
  //Enable when in Production
  //Window.enterFullscreen();
  runApp(const MyApp());

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
        scaffoldBackgroundColor: fluent_ui.Colors.transparent
      ),
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
  int _counter = 0;
  static const cursorState = SystemMouseCursors.click;
  cursorF(){
    appWindow.hide();
    var duration = const Duration(seconds: 5);
    print('Start sleeping');
    sleep(duration);
    print('5 seconds has passed');
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
      _counter++;
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
       return Scaffold(
        //works
        backgroundColor: fluent_ui.Colors.transparent,
      
      //bottomNavigationBar: ,
       body: fluent_ui.Column(mainAxisAlignment: fluent_ui.MainAxisAlignment.center,children:[ Expanded(flex:0,child:fluent_ui.Center(
        child:fluent_ui.Container(
          //mainAxisAlignment: fluent_ui.MainAxisAlignment.center,
          child:fluent_ui.Center( child: fluent_ui.FractionallySizedBox(
        widthFactor: 0.30,
        //mainAxisAlignment: fluent_ui.MainAxisAlignment.center,
        child: fluent_ui.AutoSuggestBox(
          leadingIcon: fluent_ui.Icon(fluent_ui.FluentIcons.search),
  placeholder: 'Search',
  items: const [
    'Chatilly-Tifanny',
    'Chartreux',
    'Chausie',
    'Munchkin',
    'York Chocolate',
  ],
     onChanged:(text, reason) {
       print('$text');

     },
    onSelected: (breed) {
    print(breed);
  },
)
        
     )))
     )),
  //    content: NavigationBody(index: index, children: [
  //   Container(),
  //   Container(),
  //   Container(),
  // ]),
  // bottomBar: BottomNavigation(
  //   index: index,
  //   onChanged: (i) => setState(() => index = i),
  //   items: const [
  //     BottomNavigationItem(
  //       icon: Icon(Icons.security),
  //       selectedIcon: Icon(Icons.security),
  //       title: Text('Secure Folder'),
  //     ),
  //     BottomNavigationItem(
  //       icon: Icon(Icons.folder),
  //       selectedIcon: Icon(Icons.folder),
  //       title: Text('Folders'),
  //     ),
  //     BottomNavigationItem(
  //       icon: Icon(Icons.note_alt_rounded),
  //       selectedIcon: Icon(Icons.note_alt_outlined),
  //       title: Text('New Note'),
  //     ),
  //   ],
  // ),
    Expanded(flex:0,child:fluent_ui.Container( child: fluent_ui.FractionallySizedBox(
      widthFactor: 0.30,
      child:Container(decoration: BoxDecoration(
        color: fluent_ui.Colors.white,
    border: Border.all(
    color: fluent_ui.Colors.white,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)))
    , child:fluent_ui.Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
  PageHeader(title: fluent_ui.Text('Recent',textScaleFactor: 0.5,),commandBar:DropDownButton(
  leading: const Icon(FluentIcons.sort,size: 16.0,),
  title: const Text('Sort By',textScaleFactor: 0.7,),
  items: [
    MenuFlyoutItem(
      text: const Text('Last 24H'),
      leading: const Icon(FluentIcons.calendar_day,size: 16.0,),
      onPressed: () => debugPrint('left'),
    ),
    MenuFlyoutItem(
      text: const Text('Last Week'),
      leading: const Icon(FluentIcons.calendar_week),
      onPressed: () => debugPrint('center'),
    ),
    MenuFlyoutItem(
      text: const Text('Last Month'),
      leading: const Icon(FluentIcons.calendar_year),
      onPressed: () => debugPrint('right'),
    ),
  ],
)),
  fluent_ui.Text('TEXT BUTTON'),
  fluent_ui.Text('TEXT BUTTON'),
  fluent_ui.Text('TEXT BUTTON'),
  fluent_ui.Text('TEXT BUTTON'),
  fluent_ui.Text('TEXT BUTTON')
,fluent_ui.BottomNavigation(
     index: index,
     onChanged: (i) => setState(() => index = i),
     items: const [
       BottomNavigationItem(
         icon: Icon(Icons.document_scanner),
        selectedIcon: Icon(Icons.document_scanner),
         title: Text('Docs'),
       ),
      BottomNavigationItem(
         icon: Icon(Icons.image),
         selectedIcon: Icon(Icons.image),
         title: Text('Images'),
       ),
       BottomNavigationItem(
         icon: Icon(Icons.note_alt_rounded),
         selectedIcon: Icon(Icons.note_alt_outlined),
         title: Text('Notes'),
      ),
     ],
   )]
      ))
  )))
   ,
   ]
   ) ,
   extendBody: true, );


  }
}

