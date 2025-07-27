import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products Details Screen')),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.home),
            title: Text('Susmita'),
            trailing: Icon(Icons.settings),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: 10,
      ),
    );
  }
}
