import 'package:flutter/material.dart';
import 'package:material_app/providers/settings_provider.dart';

import '../providers/forecast_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/glass_app_bar.dart';
import '../widgets/glass_panel.dart';
import '../widgets/gradient_background_wrapper.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundWrapper(
      colors: [
        Theme.of(context).primaryColorLight,
        Theme.of(context).primaryColorDark
      ],
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: GlassAppBar(
          title: Text('Settings', style: Theme.of(context).textTheme.titleLarge),
          iconTheme: Theme.of(context).iconTheme,
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GlassPanel(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SwitchListTile(
                          title: Text(
                            SettingsValues.darkTheme.value,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          value: snapshot.data!
                              .get(SettingsValues.darkTheme.value)!
                              .isSet,
                          onChanged: (value) =>
                              context.read<ThemeProvider>().setDarkTheme(value),
                        ),
                        Divider(
                          height: 1,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        SwitchListTile(
                            title: Text(
                              SettingsValues.alwaysFromApi.value,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            value: snapshot.data!
                                .get(SettingsValues.alwaysFromApi.value)!
                                .isSet,
                            onChanged: (value) {
                              context
                                  .read<ForecastProvider>()
                                  .setAlwaysFromApi(value);
                            }),
                      ],
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
              future: context.watch<SettingsProvider>().getSettings(),
            ),
          ),
        ),
      ),
    );
  }
}
