import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serve_app/controllers/favorite_controller.dart';

class FavoriteButton extends StatefulWidget {
  void Function() onTap;

  FavoriteButton({required this.onTap, super.key});

  final FavoriteController controller = Get.find();

  @override
  State<StatefulWidget> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: widget.onTap,
        child: Row(
          children: [
            Obx(() => Text(widget.controller.count().toString())),
            const SizedBox(
              width: 25,
              height: 25,
              child: Icon(Icons.star),
            ),
          ],
        ),
      ),
    );
  }
}
