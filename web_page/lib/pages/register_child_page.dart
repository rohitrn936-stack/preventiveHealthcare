import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterChildPage extends StatefulWidget {
  const RegisterChildPage({super.key});

  @override
  State<RegisterChildPage> createState() => _RegisterChildPageState();
}

class _RegisterChildPageState extends State<RegisterChildPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController childNameController = TextEditingController();
  final TextEditingController guardianController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  DateTime? selectedDate;
  String? selectedGender;

  int calculatedYears = 0;
  int calculatedMonths = 0;

  @override
  void dispose() {
    childNameController.dispose();
    guardianController.dispose();
    phoneController.dispose();
    villageController.dispose();
    dobController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,

      appBar: AppBar(
        title: const Text("Register New Child"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 650,
            padding: const EdgeInsets.all(30),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Form(
              key: _formKey,

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Child Name
                  TextFormField(
                    controller: childNameController,

                    decoration: const InputDecoration(
                      labelText: "Child Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter the child's name";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Date of Birth
                  TextFormField(
                    controller: dobController,
                    readOnly: true,

                    decoration: const InputDecoration(
                      labelText: "Date of Birth",
                      prefixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select the date of birth";
                      }
                      return null;
                    },

                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );

                      if (pickedDate != null) {
                        final DateTime today = DateTime.now();

                        int years = today.year - pickedDate.year;
                        int months = today.month - pickedDate.month;

                        if (months < 0) {
                          years--;
                          months += 12;
                        }

                        setState(() {
                          selectedDate = pickedDate;

                          calculatedYears = years;
                          calculatedMonths = months;

                          dobController.text =
                              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "Calculated Age : $calculatedYears Years  $calculatedMonths Months",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Gender
                  DropdownButtonFormField<String>(
                    value: selectedGender,

                    decoration: const InputDecoration(
                      labelText: "Gender",
                      prefixIcon: Icon(Icons.wc),
                      border: OutlineInputBorder(),
                    ),

                    items: const [
                      DropdownMenuItem(value: "Male", child: Text("Male")),
                      DropdownMenuItem(value: "Female", child: Text("Female")),
                      DropdownMenuItem(value: "Other", child: Text("Other")),
                    ],

                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },

                    validator: (value) {
                      if (value == null) {
                        return "Please select a gender";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Guardian Name
                  TextFormField(
                    controller: guardianController,

                    decoration: const InputDecoration(
                      labelText: "Guardian Name",
                      prefixIcon: Icon(Icons.family_restroom),
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter the guardian's name";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Phone Number
                  TextFormField(
                    controller: phoneController,

                    keyboardType: TextInputType.number,

                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],

                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the phone number";
                      }

                      if (value.length != 10) {
                        return "Phone number must be exactly 10 digits";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Village
                  TextFormField(
                    controller: villageController,

                    decoration: const InputDecoration(
                      labelText: "Village / Area",
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,

                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Registration Successful!"),
                            ),
                          );
                        }
                      },

                      child: const Text("Continue"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
