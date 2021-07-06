import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'form.dart';
import 'package:state_managment_provider/personListModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var personListModel = Provider.of<PersonListModel>(context);
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Person person = Person(nameController.text, age: int.parse(numberController.text));
          //Provider.of<PersonListModel>(context, listen: false).addPerson(person);
          Navigator.push(context, MaterialPageRoute(builder: (context) => FormPage()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            height: 5,
          ),
          itemCount: personListModel.personList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(personListModel.personList[index].name),
              subtitle: Text(personListModel.personList[index].age.toString()),
              trailing: IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: () {
                  //Alt Tarafta SetState kulanarak yapılması lazım
                  //personListModel.personList.removeAt(index);
                  personListModel.removePerson(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
