import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Icons',
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: const [
              WhiteCard(
                title: 'ac_unit_outlined',
                width: 170,
                child: Center( child: Icon(Icons.ac_unit_outlined) ),
              ),

               WhiteCard(
                title: 'h_mobiledata_outlined',
                width: 170,
                child: Center( child: Icon(Icons.h_mobiledata_outlined) ),
              ),

               WhiteCard(
                title: 'r_mobiledata_outlined',
                width: 170,
                child: Center( child: Icon(Icons.r_mobiledata_outlined) ),
              ),

               WhiteCard(
                title: 'label_important_outline',
                width: 170,
                child: Center( child: Icon(Icons.label_important_outline) ),
              ),

               WhiteCard(
                title: 'vaccines_outlined',
                width: 170,
                child: Center( child: Icon(Icons.vaccines_outlined) ),
              ),

               WhiteCard(
                title: 'one_x_mobiledata_outlined',
                width: 170,
                child: Center( child: Icon(Icons.one_x_mobiledata_outlined) ),
              ),

               WhiteCard(
                title: 'macro_off_outlined',
                width: 170,
                child: Center( child: Icon(Icons.macro_off_outlined) ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
