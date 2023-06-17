import 'package:flutter/material.dart';
import 'package:todo_app/Res/Component/custom_button.dart';
import 'package:todo_app/Res/Component/text_form_field.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final NameController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  double _result = 0;
  void calculatorBMI(){
    double height = double.parse(heightController.text) / 100;
    double weight = double.parse(weightController.text);
    double hightsquare = height * height;
    double result = weight / hightsquare;
    _result = result;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('images/bmi.png',height: 150.0,width: 150,),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    color: _result <  18.4 ? Colors.yellow :
                    _result < 25.0 ? Colors.green :
                    _result < 39.9 ? Colors.orange :
                    _result > 40.0 ? Colors.red :
                    Colors.grey,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${NameController.text} Your BMI Result is "
                        "${
                        _result <  18.4 ? "UnderWeight" :
                        _result < 25.0 ? "Normal" :
                        _result < 39.9 ? 'OverWeight' :
                        _result > 40.0 ? 'Obese' : ''
                    }",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _result == null ? "Enter Value" : "${_result.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Column(
              children: [
                Textfield(
                  title: 'Enter Your Name',
                  controller: NameController,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Textfield(
                        title: 'Enter Height in cm',
                        controller: heightController,
                        keyboard: TextInputType.number,
                      ),
                    ),
                    Flexible(
                      child: Textfield(
                        title: 'Enter Weight in kg',
                        controller: weightController,
                        keyboard: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            CustomButton(
              title: 'Check',
              onTap: calculatorBMI,
            ),
          ],
        ),
      ),
    );
  }
}
