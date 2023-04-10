import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';


class WarningModal extends StatefulWidget {
  const WarningModal({super.key});

  @override
  State<WarningModal> createState() => _WarningModalState();
}

class _WarningModalState extends State<WarningModal> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(Icons.warning_amber_rounded, size: 50.0),
          const Text(
            'Attention!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut faucibus pulvinar elementum integer enim. Ante metus dictum at tempor commodo ullamcorper a. Viverra justo nec ultrices dui sapien eget mi proin sed. Semper auctor neque vitae tempus. Maecenas pharetra convallis posuere morbi leo urna molestie at elementum. Volutpat commodo sed egestas egestas fringilla phasellus. Id ornare arcu odio ut sem nulla pharetra diam. Vel risus commodo viverra maecenas accumsan lacus vel facilisis volutpat. Mauris vitae ultricies leo integer malesuada nunc vel. Ullamcorper velit sed ullamcorper morbi.'),
          ),
          ElevatedButton(
            child: const Text('Okay'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
