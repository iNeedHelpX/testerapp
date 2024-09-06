import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_lab/flutter_lab.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testerapp/colors/colours_list.dart';

void main() {
  runApp(
    const FlutterLab(
      url: "192.168.2.128",
      port: 3000,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var text = "Welcome to My Home Page";

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 202, 113)),
        useMaterial3: true,
      ),
      home: MyHomePage(LabText(
        "Welcome to My Home Page",
        name: "juliatext1",
      )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.text);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final LabText text;
  late bool isExpanded = false;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
    String data = "hello";

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          "hello",
          style: GoogleFonts.baskervville(
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: LabColumn(
            name: "newcolumn1",
            children: <Widget>[
              LabContainer(
                // Container parameters
                name: containerBox().name,
                height: containerBox().height,
                width: containerBox().width,
                decoration: containerBox().decoration,
                child: LabColumn(
                  name: 'labcol',
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      // textBaseline: TextBaseline.alphabetic,
                      children: [
                        Expanded(
                          child: IconButton(
                            alignment: AlignmentDirectional.topStart,
                            padding: EdgeInsets.only(right: 10, left: 5),
                            onPressed: () {
                              //do something here
                            },
                            icon: Icon(
                                color: darkgrey,
                                size: 45,
                                MdiIcons.notebookHeart),
                          ),
                        ),

                        //just to fill the space for now and create distance between the icons

                        Expanded(
                          child: IconButton(
                            alignment: AlignmentDirectional.topCenter,
                            padding: EdgeInsets.only(right: 10, left: 5),
                            onPressed: () {
                              //do something here
                            },
                            icon: Icon(
                                color: darkgrey, size: 45, MdiIcons.ladybug),
                          ),
                        ),

                        //I only want to show the icon if widget.isExpanded is true

                        Expanded(
                          child: widget.isExpanded
                              ? IconButton(
                                  alignment: AlignmentDirectional.topEnd,
                                  padding: EdgeInsets.only(right: 5, left: 10),
                                  onPressed: () {
                                    //do something here
                                    setState(() {
                                      widget.isExpanded = false;
                                    });
                                  },
                                  icon: Icon(
                                      size: 35,
                                      color: logout,
                                      FontAwesomeIcons.deleteLeft),
                                )
                              : Container(),
                        )
                      ],
                    ),
                    const LabText(
                      "Sample",
                      name: "juliatext1",
                    ),
                    ConstrainedBox(
                      constraints: widget.isExpanded
                          //shows th text
                          ? new BoxConstraints(
                              maxHeight: containerBox().height! / 1.46)
                          : //THIS ONE COVERS THE TEXT
                          new BoxConstraints(
                              maxHeight: containerBox().height! / 6),
                      child: LabText(
                        "OK",
                        name: "loremtext",
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: (containerBox().height! / 30).toInt(),
                      ),
                    ),
                    widget.isExpanded
                        ? new Container()
                        : new TextButton(
                            child: const Text(
                              '...',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromARGB(255, 255, 233, 154)),
                            ),
                            onPressed: () =>
                                setState(() => widget.isExpanded = true),
                          ),
                  ],
                ),
              ),
              LabText(
                data,
                name: "smalltext",
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  LabContainer containerBox() {
    return LabContainer(
      name: "containerbox",
      height: 400,
      width: 360,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 255, 211, 116),
            const Color.fromARGB(255, 255, 34, 119),
            const Color.fromARGB(255, 179, 28, 248),
            const Color.fromARGB(255, 174, 130, 255),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(255, 141, 110, 251),
          width: 4,
        ),
      ),
    );
  }
}
