import 'package:flutter/material.dart';

class Complaints extends StatefulWidget {
  const Complaints({super.key});

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  final _formKey = GlobalKey<FormState>();
  final List<Complaint> _complaints = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _submitComplaint() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _complaints.add(
          Complaint(
            name: _nameController.text,
            contact: _contactController.text,
            location: _locationController.text,
            description: _descriptionController.text,
          ),
        );
        _nameController.clear();
        _contactController.clear();
        _locationController.clear();
        _descriptionController.clear();
      });
    }
  }

  void _viewComplaintDetails(Complaint complaint) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Complaint Details'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${complaint.name}"),
                Text("Contact: ${complaint.contact}"),
                Text("Location: ${complaint.location}"),
                SizedBox(height: 10),
                Text("Description:"),
                Text(complaint.description),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Close"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 233, 153),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Complaint Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField(_nameController, 'Name'),
                  _buildTextField(_contactController, 'Contact'),
                  _buildTextField(_locationController, 'Location'),
                  _buildTextField(
                    _descriptionController,
                    'Complaint Description',
                    maxLines: 3,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _submitComplaint,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF62270A),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Complaint Summary List
            Expanded(
              child:
                  _complaints.isEmpty
                      ? Center(child: Text("No complaints yet."))
                      : ListView.builder(
                        itemCount: _complaints.length,
                        itemBuilder: (context, index) {
                          final complaint = _complaints[index];
                          return Card(
                            color: Color(0xFFAE7B21),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                color: Color(0xFFF8DE24),
                                width: 2,
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                complaint.location,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                complaint.description.length > 30
                                    ? '${complaint.description.substring(0, 30)}...'
                                    : complaint.description,
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () => _viewComplaintDetails(complaint),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String labelText, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter $labelText';
          }
          return null;
        },
      ),
    );
  }
}

class Complaint {
  final String name;
  final String contact;
  final String location;
  final String description;

  Complaint({
    required this.name,
    required this.contact,
    required this.location,
    required this.description,
  });
}
