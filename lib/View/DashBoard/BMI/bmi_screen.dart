import 'package:flutter/material.dart';
import 'package:todo_app/Res/Component/text_form_field.dart';
import 'package:todo_app/View/DashBoard/BMI/BMIController.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final AgeController = TextEditingController();
  final NameController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  String dropdownValue = 'Select Your Category';
  BMIController bmiController = BMIController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bmiController.GetBMI(context);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Textfield(
          title: 'Enter Your Name',
          controller: NameController,
        ),
          Textfield(
            title: 'Enter Your AGE',
            controller: AgeController,
            keyboard: TextInputType.number,
          ),
          Row(
            children: [
              Flexible(
                child: Textfield(
                  title: 'Enter Your Height',
                  controller: heightController,
                  keyboard: TextInputType.number,
                ),
              ),
              Flexible(
                child: Textfield(
                  title: 'Enter Your Weight',
                  controller: weightController,
                  keyboard: TextInputType.number,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DropdownButtonFormField(
              decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder( //<-- SEE HERE
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder( //<-- SEE HERE
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
              dropdownColor: Colors.grey.shade100,
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Male', 'Female', 'others', 'Select Your Category'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
