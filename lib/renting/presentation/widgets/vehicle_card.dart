import 'package:flutter/material.dart';
import 'package:rca_app/renting/domain/domain.dart';



class VehicleCard extends StatelessWidget {

  final Vehicle vehicle;

  const VehicleCard({
    Key? key,
    required this.vehicle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ImageViewer( image: vehicle.image ),
        Text( vehicle.name, textAlign: TextAlign.center, ),
        const SizedBox(height: 20)
      ],
    );
  }
}

class _ImageViewer extends StatelessWidget {

  final String image;

  const _ImageViewer({ required this.image });

  @override
  Widget build(BuildContext context) {
    // Checks if the image is null or empty
    if (image == null || image.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset('assets/images/no-image.jpg',
          fit: BoxFit.cover,
          height: 250,
        ),
      );
    }

    try {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          fit: BoxFit.cover,
          height: 250,
          fadeOutDuration: Duration(milliseconds: 100),
          fadeInDuration: Duration(milliseconds: 200),
          image: NetworkImage(image),
          placeholder: const AssetImage('assets/loaders/loader-car.gif'),
        ),
      );
    } catch (e) {
      print('Failed to load network image: $e');
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset('assets/loaders/loader-car.gif',
          fit: BoxFit.cover,
          height: 250,
        ),
      );
    }
  }

}
