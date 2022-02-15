import 'package:flutter/material.dart';

import '../service/http_service.dart';
import '../service/log_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }
  @override

  String data = "";

  void _apiPostList(){
    Network.GET(Network.API_LIST,Network.paramsEmpty()).then((response) => {
      Log.d(response!),_showResponse(response),
    });
  }
  void _showResponse(String response){
    setState(() {
      data=response;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children: [
            Text(data??"no data",style: TextStyle(color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
