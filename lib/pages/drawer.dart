import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Drawer(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>
          [

          CircleAvatar(
  radius: 50,
  backgroundImage: AssetImage('assets/user.png'),
  //backgroundColor: Colors.transparent,
  child: Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage('assets/user.png'),
        fit: BoxFit.cover,
      ),
    ),
  ),
),

        SizedBox(height: 30,), 
        const Divider(
          color: Color.fromARGB(131, 158, 156, 156),
          height: 0.5,
        ),   
           ListView(
             shrinkWrap: true, 
            children: [
      //The first
        const ListTile(
          leading:  Icon(Icons.settings),
          title: Text("Settings"),
        ),
      
//The second
        const ListTile(
          leading:  Icon(Icons.light_mode),
          title: Text("Modes"),
        ),
        

//the Third

        const ListTile(
          leading:  Icon(Icons.help),
          title: Text("Help"),
        ),
       

//The fourth
        const ListTile(
          leading:  Icon(Icons.developer_mode),
          title: Text("Developers"),
        ),
       const Divider(
          color: Color.fromARGB(131, 158, 156, 156),
          height: 0.5,
        ),

//The fifth
        const ListTile(
          leading:  Icon(Icons.logout),
          title: Text("Log Out"),
        ),
        
            ],
           )  
             
             
             
          ],
        ),
      ),
    );
  }
}

 