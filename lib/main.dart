import 'package:flutter/material.dart';
import 'package:personalapp/services/Utils.dart';
import 'package:personalapp/models/AboutMe.dart';
import 'package:personalapp/models/Account.dart';
import 'package:personalapp/models/Skill.dart';
import 'package:personalapp/services/InformationServices.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Personal App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  AboutMe _aboutMe;
  Account _account;
  Skill _skill;
  final Text defaultText = Text(
    'Opss!!! Click the button first.',
    textAlign: TextAlign.left,
  );

  Future<void> _getData() async {
    _aboutMe = await InformationServices.instance.getAboutMe();
    _account = await InformationServices.instance.getAccount();
    _skill = await InformationServices.instance.getSkill();
    setState(() {});
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text('About Me'),
            children: ((_aboutMe == null)
                ? <Widget>[
                    defaultText,
                  ]
                : <Widget>[
                    Text(_aboutMe.props[0].toString() + '\n',
                      textAlign: TextAlign.center,
                    ),
                    Text(_aboutMe.props[2],
                        textAlign: TextAlign.center),
                  ]),
          ),
          ExpansionTile(
            title: Text('Skills'),
            children: ((_aboutMe == null)
                ? <Widget>[
                    defaultText,
                  ]
                : <Widget>[
                    ExpansionTile(
                      title: Text('Frameworks'),
                      children: Utils.listToTextWidget(
                          _skill.props[0], TextAlign.left),
                    ),
                    ExpansionTile(
                      title: Text('Languages'),
                      children: Utils.listToTextWidget(
                          _skill.props[2], TextAlign.left),
                    ),
                    ExpansionTile(
                      title: Text('Tools'),
                      children: Utils.listToTextWidget(
                          _skill.props[3], TextAlign.left),
                    ),
                    ExpansionTile(
                      title: Text('Interest'),
                      children: Utils.listToTextWidget(
                          _skill.props[1], TextAlign.left),
                    ),
                  ]),
          ),
          ExpansionTile(
            title: Text('Get in Touch'),
            children: ((_account == null)
                ? <Widget>[
                    defaultText,
                  ]
                : Utils.listToTextWidget2(<String>['Email', 'Github', 'Gitlab'],
                    _account.props, TextAlign.left)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getData,
        tooltip: 'Increment',
        child: Icon(Icons.file_download),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
