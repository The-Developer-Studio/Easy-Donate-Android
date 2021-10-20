import 'package:easydonatefinal/API/getFaq.dart';
import 'package:flutter/material.dart';

class FaqList extends StatefulWidget {
  const FaqList({Key key}) : super(key: key);

  @override
  _FaqListState createState() => _FaqListState();
}

class _FaqListState extends State<FaqList> {
  Future<FAQ> futureFaq;

  @override
  Widget build(BuildContext context) {
    ListTile _tile(
      String title,
      String subtitle,
    ) =>
        ListTile(
          title: Text(title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              )),
          subtitle: Text(subtitle),
        );

    ListView _jobsListView(data) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _tile(data[index].questions, data[index].answers);
          });
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<FAQ>>(
        future: fetchFaq(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<FAQ> data = snapshot.data;
            return _jobsListView(data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
