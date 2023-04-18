import 'package:flutter/material.dart';
import 'package:material_app/entities/location_search_suggestion.dart';
import 'package:material_app/http/places_api_client.dart';
import 'package:material_app/providers/forecast_provider.dart';
import 'package:material_app/widgets/gradient_background_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../entities/location.dart';
import '../widgets/glass_panel.dart';

class LocationsPage extends StatefulWidget {
  final Set<Location> locations;

  const LocationsPage({super.key, this.locations = const {}});

  @override
  State<StatefulWidget> createState() => LocationsPageState();
}

class LocationsPageState extends State<LocationsPage> with AutomaticKeepAliveClientMixin<LocationsPage>{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Autocomplete<LocationSearchSuggestion>(
          optionsBuilder: (TextEditingValue textEditingValue) async {
            if (textEditingValue.text == '') {
              return const Iterable<LocationSearchSuggestion>.empty();
            }

            final sessionToken = const Uuid().v4();

            return await PlacesApiClient(sessionToken).fetchSuggestions(
                textEditingValue.text,
                Localizations.localeOf(context).languageCode);
          },
          displayStringForOption: (option) => option.toString(),
          onSelected: (option) async {
            final sessionToken = const Uuid().v4();

            Location location = await PlacesApiClient(sessionToken)
                .getPlaceDetailFromId(option.placeId);

            setState(() {
              widget.locations.add(location);
            });
          },
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: GlassPanel(
                padding: const EdgeInsets.all(10),
                borderRadius: BorderRadius.circular(10),
                child: TextField(
                  keyboardType: TextInputType.streetAddress,
                  controller: textEditingController,
                  focusNode: focusNode,
                  onSubmitted: (value) async {
                    setState(() {
                      textEditingController.clear();
                      textEditingController.text = '';
                      onFieldSubmitted;
                    });
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: 'Add location...',
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    isCollapsed: true,
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ),
            );
          },
          optionsViewBuilder: (context, onSelected, options) {
            return Material(
              type: MaterialType.transparency,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GradientBackgroundWrapper(
                  borderRadius: BorderRadius.circular(10),
                  colors: [
                    Theme.of(context).primaryColorLight,
                    Theme.of(context).primaryColorDark
                  ],
                  child: GlassPanel(
                    borderRadius: BorderRadius.circular(10),
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      separatorBuilder: (context, index) => Divider(
                        height: 1,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (() => onSelected(options.elementAt(index))),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              options.elementAt(index).description,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Flexible(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: widget.locations.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () async {
                  await Navigator.pushNamed(
                    context,
                    '/location',
                    arguments: Provider.of<ForecastProvider>(context, listen: false)
                        .getForecast(widget.locations.elementAt(index).city!),
                  );
                },
                child: GlassPanel(
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    children: [
                      Text(widget.locations.elementAt(index).city ?? ''),
                      Text(widget.locations.elementAt(index).region ?? ''),
                      Text(widget.locations.elementAt(index).country ?? ''),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
