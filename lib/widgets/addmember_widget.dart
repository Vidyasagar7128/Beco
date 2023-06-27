import 'package:beco/models/membersmodel.dart';
import 'package:flutter/material.dart';

typedef MemberCallback = void Function(MembersModel model);

class AddMemberWidget extends StatefulWidget {
  const AddMemberWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    this.onMemberCallback,
  });
  final Function() onPressed;
  final IconData icon;
  final MemberCallback? onMemberCallback;

  @override
  State<AddMemberWidget> createState() => _AddMemberWidgetState();
}

class _AddMemberWidgetState extends State<AddMemberWidget> {
  //MembersModel model = MembersModel('name', 0);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const SizedBox(
        width: 50.0,
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Age',
          ),
        ),
      ),
      title: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Name',
        ),
      ),
      trailing: IconButton(
        onPressed: widget.onPressed,
        icon: Icon(widget.icon),
      ),
    );
    // Row(
    //   children: [
    //     Expanded(
    //       flex: 4,
    //       child: TextField(
    //         onChanged: (String val) =>
    //             widget.onMemberCallback!(MembersModel(val, 0)),
    //         key: widget.key,
    //         decoration: const InputDecoration(
    //             border: InputBorder.none, labelText: 'Name'),
    //       ),
    //     ),
    //     Expanded(
    //       flex: 2,
    //       child: TextField(
    //         onChanged: (String val) =>
    //             widget.onMemberCallback!(MembersModel("", int.parse(val))),
    //         key: widget.key,
    //         decoration: const InputDecoration(
    //             border: InputBorder.none, labelText: 'Age'),
    //       ),
    //     ),
    //     IconButton(
    //       onPressed: widget.onPressed,
    //       icon: Icon(widget.icon),
    //     ),
    //   ],
    // );
  }
}
