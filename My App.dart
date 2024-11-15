import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'name': 'Menu', 'description': 'Welcome to Menu page'},
    {'name': 'Product List', 'description': 'Python\n\nJava\n\nKotlin\n\nFlutter\n\nReact'},
    {'name': 'Contacts', 'description': 'E-Mail : shashanksmca2024@gmail.com'},
    {'name': 'About Us', 'description': 'Hi, This is Shashank S\n I completed my MCA in The Oxford College of Engineering Banglore.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shashank S'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return MouseRegion(
            onEnter: (_) {
              SystemMouseCursors.click,
            },
            onExit: (_) {
              SystemMouseCursors.basic,
            },
            child: Container(
              color: Colors.transparent,
              child: ListTile(
                title: Text(
                  items[index]['name']!,
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        name: items[index]['name']!,
                        description: items[index]['description']!,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String name;
  final String description;

  DetailScreen({required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, 
            crossAxisAlignment: CrossAxisAlignment.center, 
            children:[
              Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                                 color: Colors.blue),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.center, 
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
