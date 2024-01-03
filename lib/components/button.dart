import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum ButtonType { normal, secondary, destructive, outline, ghost, link, icon }

class CnButton extends StatelessWidget {
  const CnButton(
      {super.key,
      this.buttonType = ButtonType.normal,
      required this.child,
      required this.onPressed});
  final ButtonType buttonType;
  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Builder(
        builder: (context) {
          if (buttonType == ButtonType.secondary) {
            return CnSecondaryButton(child: child);
          } else if (buttonType == ButtonType.destructive) {
            return CnDestructiveButton(child: child);
          } else if (buttonType == ButtonType.outline) {
            return CnOutlineButton(child: child);
          } else if (buttonType == ButtonType.ghost) {
            return CnGhostButton(child: child);
          } else if (buttonType == ButtonType.link) {
            return CnLinkButton(child: child);
          } else if (buttonType == ButtonType.icon) {
            return CnIconButton(child: child);
          }
          return CnDefaultButton(child: child);
        },
      ),
    );
  }
}

class CnDefaultButton extends StatefulWidget {
  const CnDefaultButton({super.key, required this.child});
  final Widget child;

  @override
  State<CnDefaultButton> createState() => _CnDefaultButtonState();
}

class _CnDefaultButtonState extends State<CnDefaultButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
            color: isHovered
                ? const Color(0xff2f2f31).withAlpha(240)
                : const Color(0xff2f2f31),
            borderRadius: BorderRadius.circular(8)),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Geist Variable",
            color: Colors.white,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

class CnSecondaryButton extends StatefulWidget {
  const CnSecondaryButton({super.key, required this.child});
  final Widget child;

  @override
  State<CnSecondaryButton> createState() => _CnSecondaryButtonState();
}

class _CnSecondaryButtonState extends State<CnSecondaryButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
            color: isHovered
                ? const Color(0xfff6f6f7).withAlpha(240)
                : const Color(0xfff6f6f7),
            borderRadius: BorderRadius.circular(8)),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Geist Variable",
            color: Color(0xff3b3b3d),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

class CnDestructiveButton extends StatefulWidget {
  const CnDestructiveButton({super.key, required this.child});
  final Widget child;

  @override
  State<CnDestructiveButton> createState() => _CnDestructiveButtonState();
}

class _CnDestructiveButtonState extends State<CnDestructiveButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
            color: isHovered
                ? const Color(0xffdf3b3b).withAlpha(240)
                : const Color(0xffdf3b3b),
            borderRadius: BorderRadius.circular(8)),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Geist Variable",
            color: Colors.white,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

class CnOutlineButton extends StatefulWidget {
  const CnOutlineButton({super.key, required this.child});
  final Widget child;

  @override
  State<CnOutlineButton> createState() => _CnOutlineButtonState();
}

class _CnOutlineButtonState extends State<CnOutlineButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color(0xffe4e4e7),
                strokeAlign: BorderSide.strokeAlignInside),
            color: isHovered ? const Color(0xfff4f4f5) : Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Geist Variable",
            color: Color(0xff3b3b3d),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

class CnGhostButton extends StatefulWidget {
  const CnGhostButton({super.key, required this.child});
  final Widget child;

  @override
  State<CnGhostButton> createState() => _CnGhostButtonState();
}

class _CnGhostButtonState extends State<CnGhostButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
            color: isHovered
                ? const Color(0xfff4f4f5)
                : const Color(0xfff4f4f5).withAlpha(0),
            borderRadius: BorderRadius.circular(8)),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Geist Variable",
            color: Color(0xff3b3b3d),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

class CnLinkButton extends StatefulWidget {
  const CnLinkButton({super.key, required this.child});
  final Widget child;

  @override
  State<CnLinkButton> createState() => _CnLinkButtonState();
}

class _CnLinkButtonState extends State<CnLinkButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: DefaultTextStyle(
          style: TextStyle(
            fontWeight: FontWeight.w500,
            decoration:
                isHovered ? TextDecoration.underline : TextDecoration.none,
            fontFamily: "Geist Variable",
            color: const Color(0xff3b3b3d),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

class CnIconButton extends StatefulWidget {
  const CnIconButton({super.key, required this.child});
  final Widget child;

  @override
  State<CnIconButton> createState() => _CnIconButtonState();
}

class _CnIconButtonState extends State<CnIconButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color(0xffe4e4e7),
                strokeAlign: BorderSide.strokeAlignInside),
            color: isHovered ? const Color(0xfff4f4f5) : Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Geist Variable",
            color: Color(0xff3b3b3d),
          ),
          child: IconTheme(
            data: const IconThemeData(size: 16),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
