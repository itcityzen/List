import 'package:database_task/core/Calendar/tableCalendar.dart';
import 'package:database_task/core/sharedPreference/SharedPreference.dart';
import 'package:database_task/feature/registeration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:database_task/core/database/database.dart';

class homePage extends StatefulWidget {
  final int? UsernameId;
  const homePage({super.key,  this.UsernameId});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  void initState() {
    super.initState();
    fetchNotes();
    getUsernameofSet();
  }

  String UsernameSharedPreference = '';

  Future getUsernameofSet() async {
    print('waiting username');
    String? uname = await SharedPreferenceShow.getUsername();
    setState(() {
      if (uname != null) {
        print('username is done $uname');
        setState(() {
          UsernameSharedPreference = uname;
        });
      }
    });
    print('isget Done $UsernameSharedPreference');
  }

  DatabaseShow db1 = DatabaseShow();
  List<Map<String, dynamic>> myNotes = [];

  Future fetchNotes() async {
    if (widget.UsernameId != null) {
      final showData = await db1.getNotesByUserId(widget.UsernameId!);
      setState(() {
        myNotes = showData;
      });
    }
  }

  Future addnote() async {
    await db1.insertNotes({
      'title': titleController.text,
      'content': contentController.text,
    });
    await fetchNotes();
    Navigator.pop(context);
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 253, 253),
      body: Column(
        children: [
          tableCalendarForm(),
          Container(
            decoration: BoxDecoration(color: Colors.black),
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(' $UsernameSharedPreference ',
                    style: GoogleFonts.adamina(
                        color: Colors.cyan[50],
                        fontWeight: FontWeight.bold,
                        fontSize: 17.5,
                        backgroundColor: Colors.black)),
                IconButton(
                  onPressed: () async {
                    await SharedPreferenceShow.removeData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => registerationLogin()));
                  },
                  icon: Icon(
                    Icons.exit_to_app_sharp,
                    color: Colors.cyan[50],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: myNotes.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Image.asset(
                            'assets/content-style-vector.jpg',
                            width: 300,
                            height: 300,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Divider(
                            height: 10,
                            thickness: 25,
                            color: Colors.cyan[50],
                          ),
                          Text(
                            'There is no Notes Yet',
                            style: GoogleFonts.abhayaLibre(
                              textStyle: TextStyle(
                                  fontSize: 35,
                                  color: Colors.black,
                                  backgroundColor: Colors.cyan[50]),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: myNotes.length,
                      itemBuilder: (context, index) {
                        print('list view');
                        return Container(
                          margin: EdgeInsets.all(15),
                          height: 100,
                          padding: EdgeInsets.all(12),
                          color: Colors.cyan[50],
                          child: ListTile(
                            leading: Icon(
                              FontAwesomeIcons.noteSticky,
                              size: 15,
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                await db1.deleteNote(myNotes[index]['id']);
                                await fetchNotes();
                              },
                            ),
                            title: Text(
                              myNotes[index]['title'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            subtitle: Text(myNotes[index]['content']),
                          ),
                        );
                      }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 223, 245, 248),
        onPressed: showDialoggg,
        child: Icon(Icons.add),
      ),
    );
  }

  void showDialoggg() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ADD NOTES'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      fillColor: Colors.cyan[50],
                      labelText: 'Add TiTle ',
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextField(
                  controller: contentController,
                  decoration: InputDecoration(
                      labelText: 'Add Content ',
                      hintText: 'Content',
                      hintStyle: TextStyle(color: Colors.grey)),
                )
              ],
            ),
            actions: [
              TextButton(onPressed: addnote, child: Text('ADD')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('CANCEL'))
            ],
          );
        });
  }
}
