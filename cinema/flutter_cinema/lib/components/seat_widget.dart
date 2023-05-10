import 'package:flutter/material.dart';
import 'package:flutter_cinema/models/seat_type.dart';

import '../models/seat.dart';

class SeatWidget extends StatelessWidget {
  final Seat seat;
  final Size size;
  final Color? color;
  final Color? borderColor;
  final void Function()? onTap;
  late final double padding;

  SeatWidget(
      {super.key,
      required this.seat,
      this.size = const Size(50.0, 50.0),
      this.color,
      this.borderColor,
      required this.onTap})
      : padding = size.width / 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      child: seat.isAvailable
          ? InkWell(
              onTap: onTap,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: size.width - padding * 2,
                height: size.height - padding * 2,
                decoration: BoxDecoration(
                  color: color ??
                      (seat.type == SeatType.vip
                          ? Colors.blue.shade900
                          : seat.type == SeatType.better
                              ? Colors.blue
                              : Colors.blue.shade200),
                  borderRadius: BorderRadius.all(
                    Radius.circular(size.width / 10),
                  ),
                ),
                child: seat.type == SeatType.better
                    ? Container(
                        width: size.width - padding,
                        height: size.height / 4,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            strokeAlign: StrokeAlign.outside,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(size.width / 10),
                          ),
                        ),
                      )
                    : seat.type == SeatType.vip
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width / 4 - padding,
                                height: size.height,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    strokeAlign: StrokeAlign.outside,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(size.width / 10),
                                    topRight: Radius.circular(size.width / 10),
                                    bottomLeft:
                                        Radius.circular(size.width / 10),
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width / 2 - 2,
                                height: size.height / 4,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    strokeAlign: StrokeAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width / 4 - padding,
                                height: size.height,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    strokeAlign: StrokeAlign.outside,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(size.width / 10),
                                    topRight: Radius.circular(size.width / 10),
                                    bottomRight:
                                        Radius.circular(size.width / 10),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : null,
              ),
            )
          : Container(
              width: size.width - padding * 2,
              height: size.height - padding * 2,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(size.width / 10),
                ),
              ),
            ),
    );
  }
}
