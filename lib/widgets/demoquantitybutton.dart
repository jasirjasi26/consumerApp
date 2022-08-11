
import 'package:flutter/material.dart';

class QuantityButton extends StatefulWidget {
  final int initialQuantity;
  final Future<int>? Function(int) onQuantityChange;
  const QuantityButton(
      {Key? key, required this.initialQuantity,
        required this.onQuantityChange
      })
      : super(key: key);

  @override
  _QuantityButtonState createState() =>
      _QuantityButtonState(quantity: initialQuantity);
}

class _QuantityButtonState extends State<QuantityButton> {
  int quantity;
  bool isSaving = false;
  _QuantityButtonState({required this.quantity});

  void changeQuantity(int newQuantity) async {
    setState(() {
      isSaving = true;
    });
    newQuantity = await widget.onQuantityChange(newQuantity) ?? newQuantity;
    setState(() {
      quantity = newQuantity;
      isSaving = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          Container(
            height: 30.0,
            width: 90.0,
            //padding: EdgeInsets.symmetric(horizontal:1,vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              gradient: LinearGradient(
                begin: Alignment(-0.97, 0.0),
                end: Alignment(0.97, 0.11),
                colors: [const Color(0xff005fb8), const Color(0xff60cdff)],
                stops: [0.0, 1.0],
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 25.0,
                  child: IconButton(
                    onPressed: (isSaving || quantity < 1) ? null : () => changeQuantity(quantity - 1),
                    icon: Icon(Icons.remove,color: Colors.white,size: 16,),
                  ),
                ),
                SizedBox(width: 2.0,),
                Container(
                  width: 30,
                 margin: EdgeInsets.symmetric(horizontal: 2,vertical: 4),
                 // padding:
                 // EdgeInsets.symmetric(horizontal: 2.5, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      quantity.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ),
                ),
                Container(
                  width: 25.0,
                  child: IconButton(
                    onPressed: (isSaving) ? null : () => changeQuantity(quantity + 1),
                    icon: Icon(Icons.add,color: Colors.white,size: 16,),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}