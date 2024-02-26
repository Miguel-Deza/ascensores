import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormTest extends StatefulWidget {
  const FormTest({super.key});

  @override
  State<FormTest> createState() => _FormTestState();
}
class _FormTestState extends State<FormTest> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormFieldState<String>>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Test'),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              key: _emailFieldKey,
              name: 'email',
              decoration: const InputDecoration(labelText: 'Email'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              name: 'password',
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                // Validate and save the form values
                Map<String, dynamic> formData =
                    _formKey.currentState?.value ?? {};
                debugPrint(formData.toString());
                _formKey.currentState?.saveAndValidate();
                debugPrint(_formKey.currentState?.value.toString());

                // On another side, can access all field values without saving form with instantValues
                _formKey.currentState?.validate();
                debugPrint(_formKey.currentState?.instantValue.toString());
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
