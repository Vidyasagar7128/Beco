import 'package:beco/widgets/details_and_description_widget.dart';
import 'package:beco/widgets/imagepageviewwidget.dart';
import 'package:beco/widgets/servicelist_widget.dart';
import 'package:beco/widgets/textcustom.dart';
import 'package:beco/widgets/topvillasandhomewidget.dart';
import 'package:flutter/material.dart';

import '../assets/components.dart';

class RoomDetailsScreen extends StatelessWidget {
  const RoomDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Room images
            const AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: ImagePageViewWidget(),
            ),
            const SizedBox(height: 15.0),
            // Room title and description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextCustom(
                  left: leftTextPadding,
                  right: rightTextPadding,
                  child: Text(
                    'Room Title',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextCustom(
                  left: leftTextPadding,
                  right: rightTextPadding,
                  child: Text(
                    'Room description goes here. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextCustom(
                  left: leftTextPadding,
                  right: rightTextPadding,
                  child: RichText(
                    text: const TextSpan(
                      text: 'Rs 1500  ',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Rs 2300',
                          style: TextStyle(
                            fontSize: 22,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10.0)
              ],
            ),
            //Room Pricing

            // Room services
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextCustom(
                  left: leftTextPadding,
                  right: rightTextPadding,
                  child: Text(
                    'Room Services',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 80,
                  child: ServicesListWidget(
                    menuIcons: menuIcons,
                    showLabels: true,
                    width: 75.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                //Owner details

                const SizedBox(height: 10.0),
              ],
            ),
            // Address
            TextCustom(
              left: leftTextPadding,
              right: rightTextPadding,
              child: ListTile(
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                    width: 2.0,
                  ),
                ),
                onTap: () {},
                leading: const CircleAvatar(),
                title: const Text('Gaikwad Vidhyasagar Raosaheb'),
                subtitle: const Text('Verified'),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
            const SizedBox(height: 15.0),
            const SizedBox(child: DetailsAndDiscriptionWidget()),
            const TopVillasAndHomeWidget(heading: 'Related search')
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                size: 30.0,
              ),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: FilledButton.tonalIcon(
                onPressed: () => Navigator.pushNamed(context, '/confirm'),
                icon: const Icon(Icons.shopping_bag_outlined),
                label: const Text('Book'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Define a function to show a dialog
  // void _showSheet(BuildContext context) {
  //   showModalBottomSheet(
  //       enableDrag: false,
  //       isDismissible: false,
  //       isScrollControlled: false,
  //       //barrierColor: Colors.black.withAlpha(1),
  //       builder: (BuildContext context) {
  //         return BlocBuilder<FlexsearchCubit, SearchArgumentsModel>(
  //           builder: (context, state) {
  //             return SizedBox(
  //               height:
  //                   200.0, //MediaQuery.of(context).copyWith().size.height * 0.21,
  //               child: Column(
  //                 children: [
  //                   const SizedBox(height: 10.0),
  //                   InkWell(
  //                     borderRadius:
  //                         const BorderRadius.all(Radius.circular(50.0)),
  //                     onTap: () => Navigator.pop(context),
  //                     child: Container(
  //                       height: 30.0,
  //                       width: 30.0,
  //                       decoration: BoxDecoration(
  //                         color: Colors.grey.withOpacity(0.3),
  //                         borderRadius: const BorderRadius.all(
  //                           Radius.circular(50.0),
  //                         ),
  //                       ),
  //                       child: const Icon(Icons.close, size: 15.0),
  //                     ),
  //                   ),
  //                   const SizedBox(height: 10.0),
  //                   Column(
  //                     children: [
  //                       ListTile(
  //                         leading: const CircleAvatar(
  //                           child: Icon(Icons.home),
  //                         ),
  //                         onTap: () {},
  //                         title:
  //                             Text('${state.room} Room ${state.adults} Adults'),
  //                       ),
  //                       ToFromDateWidget(dateRangeCallback: (newDate) {
  //                         //state.toFrom = newDate;
  //                       }),
  //                       const PaymentButton(),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //         );
  //       },
  //       context: context);
  // }
}

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: FilledButton.tonal(
        onPressed: () => Navigator.popAndPushNamed(context, '/bookRoom'),
        child: const Text('Book'),
      ),
    );
  }
}
