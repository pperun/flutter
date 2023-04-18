import 'package:flutter/material.dart';

import '../common/material_indices.dart';
import 'color_details_page.dart';

class ColorsListPage extends StatelessWidget {
  final MaterialColor color;
  final String title;

  const ColorsListPage({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
        backgroundColor: color,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: materialIndices.length,
            itemBuilder: (BuildContext content, int index) {
              int materialIndex = materialIndices[index];
              return Container(
                color: color[materialIndex],
                child: ListTile(
                    title: Text('$materialIndex',
                        style: const TextStyle(fontSize: 24.0)),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      final result = await Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: materialIndex,
                      ) ?? 'Message not sent';

                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text('$result')));
                    }),
              );
            }),
      ),
    );
  }
}
