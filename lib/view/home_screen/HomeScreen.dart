import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivewithboxadapter/DummyDB.dart';
import 'package:hivewithboxadapter/model/EmployeeModel.dart';

import '../../AppSessions.dart';

class HomeScreen extends StatefulWidget 
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
{
  TextEditingController nameController = TextEditingController();
  TextEditingController designationController = TextEditingController();

  var employeeBox = Hive.box<Employee>(AppSessions.EmployeeBOX);

  List keys = [];



  @override
  void initState()
  {
    // App open aavumbol thanne valuesne pick cheythe konde varum
    //noteKeys = noteBox.keys.toList();
    keys = employeeBox.keys.toList();
   // setState(() {});
    super.initState();

  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: (){
            _customBottomSheet(context);
      }

      ),
      body: ListView.builder(
        itemCount: keys.length,//DummyDB.employeeList.length,
          itemBuilder: (context, index) => ListTile(
            title: Text("name : ${employeeBox.get(keys[index])!.name}"),//Text("name : ${DummyDB.employeeList[index].name}"),
            subtitle: Text("designation : ${employeeBox.get(keys[index])!.designation}"),//Text("designation : ${DummyDB.employeeList[index].designation}"),
          )),
    );
  }

  Future<dynamic> _customBottomSheet(BuildContext context) { // IsBool edit false aaki koduthu, add cheyumbol false aane, data add cheythe kazhinja true aaki kodukum, itemIndex edit aanenkil venam illenkil venda
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom), // MediaQuery veche kannunna section vare padding konde vara
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: "Name",
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: designationController,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "Designation",
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {

                            //DummyDB.employeeList.add(Employee(name: nameController.text, designation: designationController.text));
                            employeeBox.add(Employee(name: nameController.text, designation: designationController.text));
                            keys = employeeBox.keys.toList();
                            setState(() {});
                            Navigator.pop(context); // Bottom sheet closing
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                               "Add", // isEdit aanenkil Update varum.
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
