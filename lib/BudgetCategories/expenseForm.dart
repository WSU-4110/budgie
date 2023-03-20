import 'package:flutter/material.dart';

class expenseForm extends StatefulWidget {
  
  @override
  expenseFormState createState() {
    return expenseFormState();
  }
}

class expenseFormState extends State<expenseForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        TextFormField(
          decoration: const InputDecoration(
              icon: const Icon(Icons.assignment_outlined),    
              hintText: 'Enter the Name of the Expense',  
              labelText: 'Name',  
            ),  
            validator: (value) {  
              if (value == null || value.isEmpty) {  
                return 'Please enter some text';  
              }
              return null;  
            },  
          ),  
          TextFormField( 
            keyboardType: TextInputType.number, 
            decoration: const InputDecoration(  
              icon: const Icon(Icons.attach_money_rounded),  
              hintText: 'Enter the Cost',  
              labelText: 'Cost', 
            ),  
            validator: (value) {  
              if (value == null || value.isEmpty) {  
                return 'Please enter a valid number';  
              } 
              return null;  
            },  
          ),  
          TextFormField(  
            decoration: const InputDecoration(  
            icon: const Icon(Icons.calendar_today),  
            hintText: 'Enter the date of the purchase',  
            labelText: 'Select Date',  
            ),  
            onTap: () async{
              DateTime? pickeddate = await showDatePicker(
                context: context, 
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101)
                );
            },
            validator: (value) {  
              if (value == null || value.isEmpty) {  
                return 'Please enter valid date';  
              }  
              return null;  
            },  
           ),  
          new Container(  
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
              child: new ElevatedButton(  
                child: const Text('Submit'),  
                onPressed: () {  
                  // It returns true if the form is valid, otherwise returns false  
                  if (_formKey.currentState!.validate()) {  
                    // If the form is valid, display a Snackbar.  
                    ScaffoldMessenger.of(context)  
                        .showSnackBar(const SnackBar(content: Text('Data is in processing.')));  
                  }  
                },  
              )),  
        ],  
      ),  
    );  
  }  
}  



