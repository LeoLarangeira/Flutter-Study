import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:mobx_study/screens/login_screen.dart';
//import 'package:mobx_study/stores/list_store.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController _controller = TextEditingController();
  String todoValue = '';
  //ListStore listStore = ListStore();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Tarefas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 32),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      icon: const Icon(Icons.exit_to_app),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Observer(
                          builder: (_) {
                            return TextFormField(
                              controller: _controller,
                              obscureText: false,
                              onChanged: (todo) {
                                //GetIt.I.get<ListStore>().uptadeName(name: todo);
                              },
                              decoration: InputDecoration(
                                hintText: "todo",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade600),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _buttonSave(todoValue);
                                  },
                                  icon: const Icon(Icons.add),
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Observer(
                          builder: (_) {
                            return Expanded(
                              child: ListView.separated(
                                itemBuilder: (_, index) {
                                  return ListTile(
                                    title: Text(
                                      'Item $index',
                                    ),
                                    onTap: () {},
                                  );
                                },
                                separatorBuilder: (_, ___) {
                                  return const Divider();
                                },
                                itemCount: 1,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buttonSave(String name) async {
    return await 'Saved';
  }
}
