import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/add_data_page.dart';
import 'package:provider_state_management/list_map_provider.dart';
import 'package:provider_state_management/update_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Consumer<ListMapProvider>(
        builder: (ctx, provider, __) {
          var allData = provider.getData();
          return allData.isNotEmpty
              ? ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return Card(
                      child: ListTile(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UpdatePage(name: allData[index]['name'], age: allData[index]['age'], cgpa: allData[index]['cgpa'],index: index,)));
                        },
                        title: Text('${allData[index]['name']}'),
                        subtitle: Text('${allData[index]['age']}'),
                        trailing: Text('${allData[index]['cgpa']}'),
                      ),
                    );
                  })
              : const Center(child: Text('No data available'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddDataPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
