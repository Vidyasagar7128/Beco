import 'package:flutter/material.dart';

import '../../widgets/components/checkbox_component.dart';

class FilterOne extends StatefulWidget {
  const FilterOne({super.key});

  @override
  State<FilterOne> createState() => _FilterOneState();
}

class _FilterOneState extends State<FilterOne> {
  bool isParking = false;
  bool fourVeh = false;
  bool twoVeh = false;
  RangeValues rangeValues = const RangeValues(2000, 5000);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Parking'),
            CheckBoxComponent(
              value: isParking,
              onChanged: (val) {
                setState(() {
                  isParking = val!;
                });
              },
            ),
          ],
        ),
        isParking
            ? Column(
                children: [
                  CheckboxListTile(
                    title: const Text('Bike'),
                    value: twoVeh,
                    onChanged: (val) {
                      setState(() {
                        twoVeh = val!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Car'),
                    value: fourVeh,
                    onChanged: (val) {
                      setState(() {
                        fourVeh = val!;
                      });
                    },
                  ),
                ],
              )
            : const SizedBox.shrink(),
        // RangeSlider(
        //   max: 5000,
        //   min: 2000,
        //   labels: RangeLabels(rangeValues.start.round().toString(),
        //       rangeValues.end.round().toString()),
        //   values: rangeValues,
        //   onChanged: (val) {
        //     log(val.toString());
        //     setState(() {
        //       rangeValues = val;
        //     });
        //   },
        // ),
      ],
    );
  }
}
