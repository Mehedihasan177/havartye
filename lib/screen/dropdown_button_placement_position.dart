import 'package:flutter/material.dart';

class PlacementPosition {
  final String title;
  final int posID;

  PlacementPosition(this.title,this.posID);
}

final List<PlacementPosition> placementpositon = <PlacementPosition>[
  PlacementPosition('Right',2),
  PlacementPosition('Left',1),

];