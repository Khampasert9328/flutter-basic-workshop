import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  const ListviewPage({super.key});
  @override
  State<ListviewPage> createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "ຂໍ້ມູນທົ່ວໄປ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                  title: const CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                  icon: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.nat,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(Icons.add),
                title: Text("ຂໍ້ມູນ $index"),
                subtitle: Text("ຂໍ້ມູນທົ່ວໄປ $index"),
                trailing: const Icon(Icons.add),
              ),
            ),
          );
        }),
      ),
    );
  }
}
