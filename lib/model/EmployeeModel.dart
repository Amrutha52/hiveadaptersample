import 'package:hive/hive.dart';

part 'EmployeeModel.g.dart';

@HiveType(typeId: 1)
class Employee
{
  @HiveField(0)
  String designation;

  @HiveField(1)
  String name;

  Employee({required this.name, required this.designation});
}

// To generate a TypeAdapter for a class, annotate it with @HiveType and provide a typeId (between 0 and 223)
// Annotate all fields which should be stored with @HiveField
// Run build task dart run build_runner build
// Register the generated adapter
// As you can see, each field annotated with @HiveField has a unique number (unique per class). These field numbers are used to identify the fields in the Hive binary format, and should not be changed once your class is in use.