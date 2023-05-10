import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinema/bloc/ticket_purchase_bloc/ticket_purchase_bloc.dart';
import 'package:flutter_cinema/components/button.dart';
import 'package:flutter_cinema/components/decorated_text_field.dart';

import '../models/purchase_info.dart';

class PurchaseInfoForm extends StatefulWidget {
  final List<int> selectedSeats;
  final int sessionId;

  const PurchaseInfoForm(
      {super.key, required this.selectedSeats, required this.sessionId});

  @override
  State<StatefulWidget> createState() => PurchaseInfoFormState();
}

class PurchaseInfoFormState extends State<PurchaseInfoForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _cardNumberController;
  late final TextEditingController _expirationDateController;
  late final TextEditingController _cvvController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _cardNumberController = TextEditingController();
    _expirationDateController = TextEditingController();
    _cvvController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Payment data',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            DecoratedTextField(
              textEditingController: _emailController,
              hintText: 'Email',
            ),
            const SizedBox(height: 10),
            DecoratedTextField(
              textEditingController: _cardNumberController,
              hintText: 'Card number',
            ),
            const SizedBox(height: 10),
            DecoratedTextField(
              textEditingController: _expirationDateController,
              hintText: 'Expiration date',
            ),
            const SizedBox(height: 10),
            DecoratedTextField(
              textEditingController: _cvvController,
              hintText: 'CVV',
            ),
            const SizedBox(height: 20),
            Button(
              onTap: () {
                context.read<TicketPurchaseBloc>().add(
                      BuyTicketsEvent(
                        info: PurchaseInfo(
                            List.from(widget.selectedSeats),
                            widget.sessionId,
                            _emailController.text,
                            _cardNumberController.text,
                            _expirationDateController.text,
                            _cvvController.text),
                      ),
                    );
              },
              child: const Text('Buy'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _cardNumberController.dispose();
    _expirationDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
}
