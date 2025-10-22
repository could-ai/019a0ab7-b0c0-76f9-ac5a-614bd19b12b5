import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _issueController = TextEditingController();
  String _serviceType = 'Repair';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Service Request Form',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => value?.isEmpty ?? true ? 'Please enter your name' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => value?.isEmpty ?? true ? 'Please enter your email' : null,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: (value) => value?.isEmpty ?? true ? 'Please enter your phone' : null,
              ),
              DropdownButtonFormField<String>(
                value: _serviceType,
                items: ['Repair', 'Maintenance', 'Upgrade', 'Consultation']
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) => setState(() => _serviceType = value!),
                decoration: const InputDecoration(labelText: 'Service Type'),
              ),
              TextFormField(
                controller: _issueController,
                decoration: const InputDecoration(labelText: 'Describe the issue'),
                maxLines: 3,
                validator: (value) => value?.isEmpty ?? true ? 'Please describe the issue' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Submit form (would send to backend in real app)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Service request submitted!')),
                    );
                    _clearForm();
                  }
                },
                child: const Text('Submit Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _issueController.clear();
    setState(() => _serviceType = 'Repair');
  }
}