import 'package:flutter/material.dart';
import 'package:fluttermath/student.dart';
import 'package:fluttermath/student_bloc.dart';

class HomeStudent extends StatelessWidget {
  HomeStudent({Key? key}) : super(key: key);
  final _studentBloc = StudentBloc();

  String? dName ;

  @override
  Widget build(BuildContext context) {
    dName ??= 'Zaynab';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Score App'),
      ),
      body: StreamBuilder<List<Student>>(
        stream: _studentBloc.studentListStream,
        builder: (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2.0,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const SizedBox(width: 10),
                      Text(
                        // '${snapshot.data![index].id}.',
                        dName ?? 'no child',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(width: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.network(
                          snapshot.data![index].photo,
                          height: 50.0,
                          width: 50.0,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data![index].name,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              snapshot.data![index].score.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: const Icon(Icons.remove),
                          color: Colors.red,
                          onPressed: () {
                            _studentBloc.studentScoreDecrement
                                .add(snapshot.data![index]);
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          color: Colors.green,
                          onPressed: () {
                            _studentBloc.studentScoreIncrement
                                .add(snapshot.data![index]);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
