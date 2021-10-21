import 'package:flutter/material.dart';

class OverlayView extends StatefulWidget {
  const OverlayView({Key? key}) : super(key: key);

  @override
  _OverlayViewState createState() => _OverlayViewState();
}

class _OverlayViewState extends State<OverlayView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              CountriesField(),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'City'),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                child: Text('SUBMIT'),
                onPressed: () {
                  // submit the form
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CountriesField extends StatefulWidget {
  const CountriesField({
    Key? key,
  }) : super(key: key);

  @override
  _CountriesFieldState createState() => _CountriesFieldState();
}

class _CountriesFieldState extends State<CountriesField> {
  final FocusNode _focusNode = FocusNode();
  late OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context)!.insert(_overlayEntry);
      } else {
        _overlayEntry.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    print(offset.dx);
    print(offset.dy);

    return OverlayEntry(
        builder: (context) => Positioned(
              left: offset.dx,
              top: offset.dy + size.height + 5.0,
              //left: 0,
              width: size.width,

              child: Material(
                elevation: 4.0,
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: <Widget>[
                    ListTile(
                      title: Text('Syria'),
                    ),
                    ListTile(
                      title: Text('Lebanon'),
                    )
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      decoration: InputDecoration(labelText: 'Country'),
    );
  }
}
