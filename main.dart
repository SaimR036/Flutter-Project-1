
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:ID(),
  ));
}
class ID extends StatefulWidget {
  const ID({Key? key}) : super(key: key);

  @override
  State<ID> createState() => _IDState();
}

class _IDState extends State<ID> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,

      appBar: AppBar(
        title: const Text('NATIONAL CARD',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Lobster',
        )),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
floatingActionButton: FloatingActionButton(
  onPressed: () async{
    _incrementCounter();

      },
  child:Icon(Icons.add,
  color: Colors.blueGrey,
  size: 40.0,),
  backgroundColor: Colors.white10
  ,
),
      body:Column(
        mainAxisAlignment:  MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:  100.0),
              child:CircleAvatar(
                backgroundImage:AssetImage('assets/pic.jpg'),
                radius: 110.0,
              ),
            ),
         Container(
           padding: const EdgeInsets.fromLTRB(45.0, 0.0, 0.0, 0.0),
         child:const Text('Name: ',
         style: TextStyle(
           fontSize: 40.0,
           fontFamily: 'Lobster',
           color: Colors.grey,
         ),),

         ),
          SizedBox(height:0.0),
          const Center(
            child:Text('Saim Ur Rehman',
            style: TextStyle(
              fontFamily: 'Lobster',
              fontSize: 40.0,
            ),),

          ),
          SizedBox(height: 0.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              SizedBox(width: 50.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal:0.0),
            child:const Icon(Icons.email,
              size:40.0,
              color: Colors.blueGrey,
            ),


          ),
            SizedBox(width: 10.0),
            Text('saimr036@gmail.com',
              style: TextStyle(
                fontSize: 25.0,
                color:Colors.black38

              ),
            )
    ]
          ),
          SizedBox(height: 0.0,),
          Row(
    children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(horizontal: 30.0)),
          Text('Level: ',
          style: TextStyle(
            fontSize: 40.0,
            color: Colors.grey,
            fontFamily: 'Lobster',

          ),),
          ],
          ),
          SizedBox(height: 0.0,),
          Padding(
            padding:EdgeInsets.symmetric(horizontal:  150.0),
          child:Text('$_counter',
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.blue,
            fontFamily: 'Lobster',

          ),),
          ),



        ],



      )





    );
  }
}
