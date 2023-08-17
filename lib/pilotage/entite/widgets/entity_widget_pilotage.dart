import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EntityWidget extends StatefulWidget {
  const EntityWidget({Key? key}) : super(key: key);

  @override
  State<EntityWidget> createState() => _EntityWidgetState();
}

class _EntityWidgetState extends State<EntityWidget> {
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 30,
      onTap: () {},
      onHover: (value) {
        setState(() {
          _isHovering = value;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Text(
              "Ayamé",
              style: TextStyle(
                  fontSize: 30,
                  color: _isHovering ? Color.fromARGB(255, 229, 212, 212) : Colors.white,)
            ),
            Icon(
              _isHovering ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_outlined,
              color: _isHovering ? Color.fromARGB(255, 229, 212, 212) : Colors.white,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}