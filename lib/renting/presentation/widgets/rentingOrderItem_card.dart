import 'package:flutter/material.dart';
import 'package:rca_app/renting/domain/domain.dart';

class RentingOrderItemCard extends StatelessWidget {

  final RentingOrderItem item;
  
  const RentingOrderItemCard({
    Key? key,
    required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color estadoColor;
    String estadoText;
    
    switch (item.state) {
      case 'O':
        estadoColor = Colors.orange;
        estadoText = 'On request';
        break;
      case 'A':
        estadoColor = Colors.green;
        estadoText = 'Accepted';
        break;
      case 'D':
        estadoColor = Colors.red;
        estadoText = 'Denied';
        break;
      case 'R':
        estadoColor = Colors.blue;
        estadoText = 'Ordered';
        break;
      default:
        estadoColor = Colors.black;
        estadoText = '';
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Adjust the radius as per your preference
        border: Border.all(
          color: Colors.grey, // Adjust the border color as per your preference
          width: 1.0, // Adjust the border width as per your preference
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Request',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            'Estado: $estadoText',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: estadoColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Fecha de inicio: ${item.startDate}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          Text(
            'Fecha de inicio: ${item.endDate}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          Text(
            'Price: ${item.rentingPrice} ${item.currency}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

}