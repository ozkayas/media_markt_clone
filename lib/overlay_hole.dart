import 'package:flutter/material.dart';

class OverlayHoleView extends StatefulWidget {
  const OverlayHoleView({Key? key}) : super(key: key);

  @override
  _OverlayHoleViewState createState() => _OverlayHoleViewState();
}

class _OverlayHoleViewState extends State<OverlayHoleView> {
  late OverlayEntry overlayEntry;
  final removeButtonKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    overlayEntry = OverlayEntry(builder: (context) {
      return Container();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: Colors.blueGrey,
          child: Text('COOL APPBAR'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.amberAccent,
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    color: Colors.redAccent,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.indigoAccent,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        ///Get information of area not to be shaded
                        RenderBox renderBox = removeButtonKey.currentContext!
                            .findRenderObject() as RenderBox;
                        Size size = renderBox.size;
                        Offset offset = renderBox.localToGlobal(Offset.zero);
                        print(size);
                        print(offset);

                        overlayEntry = OverlayEntry(builder: (context) {
                          return Container(
                            color: Colors.orange.withOpacity(.4),
                            child: ElevatedButton(
                                onPressed: () {
                                  overlayEntry.remove();
                                },
                                child: Text('Remove This Overlay')),
                          );
                        });
                        Overlay.of(context)?.insert(overlayEntry);
                      },
                      child: Text('Open Overlay')),
                  ElevatedButton(
                      key: removeButtonKey,
                      onPressed: () {
                        print('Close Clicked');
                        overlayEntry.remove();
                      },
                      child: Text('Close Overlay'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
