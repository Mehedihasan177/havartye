import 'package:flutter/material.dart';

class PlacementPosition {
  final String title;
  final int posID;

  PlacementPosition(this.title,this.posID);
}

final List<PlacementPosition> placementpositon = <PlacementPosition>[
  PlacementPosition('Left',1),
  PlacementPosition('Right',2),

];