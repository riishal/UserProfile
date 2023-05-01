import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/Provider.dart';
import 'UserDetails.dart';

int buttonindex = 0;

Future<void> _refresh() {
  return Future.delayed(const Duration(seconds: 2));
}

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, getdata, child) {
      getdata.fetchData();
      if (getdata.status == Providerstatus.COMPLETED) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('PROFILES')),
            elevation: 0,
          ),
          body: SafeArea(
              child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: getdata.datas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading:
                      const CircleAvatar(radius: 30, child: Icon(Icons.person)),
                  title: Text(getdata.datas[index].name),
                  subtitle: Text(getdata.datas[index].email),
                  trailing: Text(
                    getdata.datas[index].phone,
                    style: const TextStyle(fontSize: 10),
                  ),
                  onTap: () {
                    buttonindex = index;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserDetails(index: index, string: const []),
                        ));
                  },
                );
              },
            ),
          )),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
      }
    });
  }
}
