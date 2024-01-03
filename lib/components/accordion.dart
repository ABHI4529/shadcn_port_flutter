import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum AccordionType { single, multi }

class CnAccordion extends StatefulWidget {
  const CnAccordion(
      {super.key,
      this.accordionType = AccordionType.single,
      required this.items});
  final AccordionType? accordionType;
  final List<AccordionTile> items;

  @override
  State<CnAccordion> createState() => _CnAccordionState();
}

class _CnAccordionState extends State<CnAccordion> {
  List<bool> _expandedList = [];

  @override
  void initState() {
    _expandedList = List.generate(widget.items.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.items.length,
      itemBuilder: (context, index) => CnAccordionItem(
        title: widget.items[index].title,
        isSelected: _expandedList[index],
        child: widget.items[index].child,
        onTap: () {
          if (widget.accordionType == AccordionType.single) {
            for (int i = 0; i < _expandedList.length; i++) {
              if (i != index) {
                _expandedList[i] = false;
              }
            }
          }
          setState(() {
            _expandedList[index] = !_expandedList[index];
          });
        },
      ),
    );
  }
}

class CnAccordionItem extends StatefulWidget {
  const CnAccordionItem(
      {super.key,
      required this.title,
      required this.child,
      required this.onTap,
      required this.isSelected});
  final Widget title;
  final Widget child;
  final bool isSelected;
  final Function onTap;

  @override
  State<CnAccordionItem> createState() => _CnAccordionItemState();
}

class _CnAccordionItemState extends State<CnAccordionItem> {
  bool isHoverd = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xffe4e4e7), width: 1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MouseRegion(
            onEnter: (event) {
              setState(() {
                isHoverd = true;
              });
            },
            onExit: (event) {
              setState(() {
                isHoverd = false;
              });
            },
            child: GestureDetector(
              onTap: () {
                widget.onTap();
              },
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultTextStyle(
                        style: TextStyle(
                            fontFamily: "Geist Variable",
                            color: const Color(0xff09090b),
                            fontWeight: FontWeight.w500,
                            decoration: isHoverd
                                ? TextDecoration.underline
                                : TextDecoration.none),
                        child: widget.title),
                    RotatedBox(
                      quarterTurns: widget.isSelected ? 1 : 3,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 12,
                        color: Color(0xff95959c),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linearToEaseOut,
            height: widget.isSelected ? 100 : 0,
            child: SingleChildScrollView(
              child: widget.child,
            ),
          )
        ],
      ),
    );
  }
}

class AccordionTile {
  AccordionTile({required this.title, required this.child});

  final Widget title;
  final Widget child;
}
