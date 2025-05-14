import 'package:flutter/material.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final _addressController = TextEditingController();
  final _noteController = TextEditingController();
  bool _isLoading = false;

  void _submitForm() async {
    setState(() {
      _isLoading = true;
    });
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
  
    setState(() {
      _isLoading = false;
    });
    _addressController.clear();
    _noteController.clear();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 3, 17, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 2),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Text("Create New Note ",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 224, 224, 224),
                  )),
              const SizedBox(height: 40),
              const Text("Head line",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 224, 224, 224),
                  )),
              const SizedBox(height: 12),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  hintText: 'Enter Note Address',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(188, 224, 224, 224)),
                  fillColor: const Color.fromRGBO(242, 214, 241, 0.08),
                  filled: true,
                ),
        
                textInputAction: TextInputAction.next,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text("Description",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 224, 224, 224),
                  )),
              const SizedBox(height: 12),
              
              TextFormField(
                controller: _noteController,
                maxLines: 5,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  hintText: "Enter Your Description",
                
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  hintStyle: const TextStyle(fontSize: 15,
                      color: Color.fromARGB(186, 253, 250, 250)),
                  fillColor: const Color.fromRGBO(242, 214, 241, 0.08),
                  filled: true,
                
                ),
              
                textInputAction: TextInputAction.next,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 70),
              InkWell(
                onTap: _isLoading ? null : _submitForm,
                canRequestFocus: false,
                enableFeedback: false,
                borderRadius: BorderRadius.circular(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  width: 312,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(255, 8, 83, 143)),
                          ),
                        )
                      : const Text('Select Media',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                ),
              ),
              const SizedBox(height: 13),
              InkWell(
                onTap: _isLoading ? null : _submitForm,
                canRequestFocus: false,
                enableFeedback: false,
                borderRadius: BorderRadius.circular(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  width: 312,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(255, 8, 83, 143)),
                          ),
                        )
                      : const Text("Create",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
