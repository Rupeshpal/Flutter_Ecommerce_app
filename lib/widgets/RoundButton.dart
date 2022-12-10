import 'package:flutter/material.dart';
class RoundButton extends StatelessWidget {
  final String tittle ;
  final VoidCallback onTap;
  final bool loading;
  const RoundButton({Key? key ,
    required this.tittle,
    required this.onTap,
    this.loading= false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(

        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child:loading ? const CircularProgressIndicator( strokeWidth: 3, color: Colors.white,) :
          Text(tittle, style: const TextStyle(
            fontSize:15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        ),
      ),
    );
  }
}
