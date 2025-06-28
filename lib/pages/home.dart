import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  late Future<List<dynamic>> futureUsers;

Future<List<dynamic>> fetchUsers() async {
    //FETCHING
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'),   
    //FIX BUG GAK MAU FETCHING   
    headers: { 
      'User-Agent': 'Mozilla/5.0', 
      'Accept': 'application/json',
    },
);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Gagal Memuat Data");
    }
}


   
   @override
   void initState(){
    super.initState();
    futureUsers = fetchUsers();
   }
   void _refresh(){
    setState(() {
      futureUsers = fetchUsers();
    });
   }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API"),
      actions: [
        IconButton(
          onPressed: _refresh,
          icon: const Icon(
          Icons.refresh),
          tooltip: "Refresh Data",
          ),
      ],),
      body: Padding(padding: EdgeInsets.all(16),
      child: FutureBuilder(
        future: fetchUsers(), 
        builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(),);
        } else if (snapshot.hasError){
          return 
              Center(child: Text('Error : ${snapshot.error}'),);
        } else if (snapshot.hasData){
          final users = snapshot.data!;
          return Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context,index){
                final user = users[index];
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(user["name"]),
                  subtitle: Text(user["email"]),
                  );
                }
            ),
          );
          } else {
            return Center(child: Text("Tidak Ada Data"),);
          }
      }
      ),
      ),
    );
  }
}