import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wothcompanion/generated/assets.gen.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/miscellaneous/values.dart';
import 'package:wothcompanion/widgets/app/error.dart';
import 'package:wothcompanion/widgets/app/padding.dart';

abstract class BuilderBuilder extends StatefulWidget {
  final String _builderId;

  const BuilderBuilder(
    String builderId, {
    super.key,
  }) : _builderId = builderId;

  String get builderId => _builderId;
}

abstract class BuilderBuilderState extends State<BuilderBuilder> {
  final Map<String, dynamic> loadedData = {};

  void updateProgress(String key, dynamic data) {
    loadedData.putIfAbsent(key, () => data);
  }

  void initializeData(AsyncSnapshot<Map<String, dynamic>> snapshot, BuildContext context);

  loadData();

  buildFutureWidget(BuildContext context);

  Widget _buildLoadingBackground() {
    ImageProvider background = AssetImage(Assets.graphics.images.woth.path);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: background,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildLoadingSpinKit() {
    return WidgetPadding.a30(
      background: Interface.primaryDark.withOpacity(0.6),
      alignment: Alignment.bottomRight,
      child: SpinKitWave(
        size: Values.indicatorSize,
        itemBuilder: (context, index) {
          return Container(
            color: Interface.primary,
            margin: const EdgeInsets.only(left: 1, right: 1),
          );
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Stack(
              children: [
                _buildLoadingBackground(),
                _buildLoadingSpinKit(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidget(AsyncSnapshot<Map<String, dynamic>> snapshot, BuildContext context) {
    if (snapshot.hasError) {
      return WidgetError(
        code: "Ex${widget.builderId}001",
        error: "${snapshot.error}",
        stack: "${snapshot.stackTrace}",
      );
    } else if (!snapshot.hasData) {
      return WidgetError(
        code: "Ex${widget.builderId}002",
        error: "${snapshot.error}",
        stack: "${snapshot.stackTrace}",
      );
    } else if (snapshot.data!.length != loadedData.length) {
      return WidgetError(
        code: "Ex${widget.builderId}003",
        error: "${snapshot.error}",
        stack: "${snapshot.stackTrace}",
      );
    } else {
      initializeData(snapshot, context);
      return buildFutureWidget(context);
    }
  }

  Widget _buildWidgets(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingWidget();
        } else if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox.shrink();
        } else {
          return _buildWidget(snapshot, context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
