import 'package:flutter/material.dart';
import 'package:gennexs_workshop_flutter_basic/models/users_models.dart';

class Detail extends StatefulWidget {
  Datum detail;
  Detail({super.key, required this.detail});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.detail.name ??"NoData"),
      ),
    );
  }
}
