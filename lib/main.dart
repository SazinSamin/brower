import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _textEditingController = TextEditingController();
  FlutterWebviewPlugin _flutterWebviewPlugin = FlutterWebviewPlugin();

  String urlHeader = 'https://';
  String urlName = 'google.com';


  _urlLauncher(){
    urlName = _textEditingController.text;
    String urlFull = urlHeader + urlName;
    print(urlFull);
    try{
      _flutterWebviewPlugin.reloadUrl(urlFull);
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        appBar: AppBar(
          backgroundColor: Colors.white54,
          leading: IconButton(icon: Icon(Icons.home, color: Colors.black,),onPressed: (){},),
          title: TextField(
            controller: _textEditingController,
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter url here",
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.navigate_next, color: Colors.black,),
                onPressed: (){
                  _urlLauncher();
                }),

          ],
        ),
        withZoom: true,
        url: urlHeader + urlName);
  }
}
