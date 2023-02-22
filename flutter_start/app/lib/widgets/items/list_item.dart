import 'package:flutter/material.dart';

abstract class ListItem {
  Widget title(BuildContext context);
  Widget subtitle(BuildContext context);
  Widget details(BuildContext context);
}