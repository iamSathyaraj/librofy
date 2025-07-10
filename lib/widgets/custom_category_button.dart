import 'package:flutter/material.dart';

class CustomCategoryButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  const CustomCategoryButton({

    super.key,
    required this.label,
    required this.onTap,
    this.isSelected = false
    });

  @override
  State<CustomCategoryButton> createState() => _CustomCategoryButtonState();
}

class _CustomCategoryButtonState extends State<CustomCategoryButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: widget.onTap,
    style: OutlinedButton.styleFrom(
      backgroundColor: widget.isSelected ? const Color.fromARGB(255, 88, 84, 75) : Colors.white,
      side: BorderSide(color: const Color.fromARGB(255, 138, 117, 73),width: 1.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),

      ),

    ),
     child: Text(widget.label,
     style: TextStyle(
      color: widget.isSelected ? Colors.white : Colors.black

     ),
     ));
  }
}