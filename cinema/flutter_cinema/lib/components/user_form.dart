import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinema/bloc/user_bloc/user_bloc.dart';
import 'package:flutter_cinema/components/button.dart';
import 'package:flutter_cinema/components/delayed_slide_transition.dart';

import '../models/user.dart';
import 'decorated_text_field.dart';

class UserForm extends StatefulWidget {
  final User user;

  const UserForm({super.key, required this.user});

  @override
  State<StatefulWidget> createState() => UserFormState();
}

class UserFormState extends State<UserForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController(text: widget.user.name);
    _phoneNumberController =
        TextEditingController(text: widget.user.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: DelayedSlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: const Offset(0.0, 0.0),
          ),
          duration: const Duration(milliseconds: 200),
          child: Column(
            children: [
              Text(
                'User',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              DecoratedTextField(
                textEditingController: _nameController,
                hintText: 'Your name here',
              ),
              const SizedBox(height: 10),
              DecoratedTextField(
                textEditingController: _phoneNumberController,
                hintText: 'Your phone number here',
              ),
              const SizedBox(height: 20),
              Button(
                  onTap: () {
                    if (_nameController.text != widget.user.name ||
                        _phoneNumberController.text !=
                            widget.user.phoneNumber) {
                      context.read<UserBloc>().add(
                            UpdateUser(
                              fields: {
                                'name': _nameController.text,
                                'phoneNumber': _phoneNumberController.text,
                              },
                            ),
                          );
                    }
                  },
                  child: const Text('Update'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
