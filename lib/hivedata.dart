import'package:flutter/material.dart';
import 'package:hive/hive.dart';
class HivedatastoreExample extends StatefulWidget {
  @override
  State<HivedatastoreExample> createState()=> _HivedatastoreExampleState();
}

class _HivedatastoreExampleState extends State<HivedatastoreExample>{
  late Box box;
  String? username;
  @override
  void initState(){
    super.initState();
    box=Hive.box('mybox');
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("HIVE  DATA  STORE  EXAMPLE"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              setState(() {
                box.put('username', 'hi');
              });
            }, child: Text("Store Data")),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              setState(() {
                username=box.get('username');
              });
            }, child: Text("Retrive Data")),
             SizedBox(height: 20,),
            Text(username!=null? 'stored username:$username':'no username stored'),
          ],
        ),
      ),
    );
  }
}