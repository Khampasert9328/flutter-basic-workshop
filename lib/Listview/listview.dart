import 'package:flutter/material.dart';
import 'package:gennexs_workshop_flutter_basic/GetData/get_data.dart';
import 'package:gennexs_workshop_flutter_basic/Listview/detail.dart';
import 'package:provider/provider.dart';

class ListviewPage extends StatefulWidget {
  const ListviewPage({super.key});
  @override
  State<ListviewPage> createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  @override
  void initState() {
    getDataFormProvider();
    super.initState();
  }

  void getDataFormProvider() async {
    final provider = Provider.of<GetData>(context, listen: false);
    await provider.getUserProvider();
  }

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
        body: Consumer<GetData>(
          builder: (context, value, child) {
            // print("data====${value.users?.data}");
            if (value.users == null || value.users!.data!.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: value.users?.data?.length ?? 0,
              itemBuilder: ((context, index) {
                final data = value.users?.data?[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Detail(
                          detail: value.users!.data![index],
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
                      title: Text(data?.name ?? "ບໍ່ມີຂໍ້ມູນ"),
                      subtitle: Text(data!.role.toString()),
                      trailing: const Icon(Icons.add),
                    ),
                  ),
                );
              }),
            );
          },
        ));
  }
}
