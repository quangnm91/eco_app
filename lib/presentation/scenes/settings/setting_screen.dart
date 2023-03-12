import 'package:eco_app/data/local/authenticated_cache.dart';
import 'package:eco_app/domain/usecases/auth_usecases.dart';
import 'package:eco_app/presentation/scenes/settings/setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../injector.dart';
import '../../../routes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = SettingBloc(
        authUsecases: injector<AuthUsecases>(),
        authenticatedCache: injector<AuthenticatedCache>())
      ..add(const InitialEvent());
    return BlocConsumer<SettingBloc, SettingState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.status == SettingStatus.error) {
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: const Text('ERROR'),
                  content: Text(state.message),
                  actions: [
                    TextButton(
                        child: const Text('Ok'),
                        onPressed: () => Navigator.of(context).pop())
                  ],
                );
              });
        }
        if (state.status == SettingStatus.logout) {
          bloc.authenticatedCache.removeToken().then((value) => {});
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.letUsIn, (Route<dynamic> route) => false);
          // Navigator.of(context)
          //     .pushNamedAndRemoveUntil(Routes.letUsIn, (route) => false);
        }
      },
      builder: (context, state) {
        if (state.status == SettingStatus.loading) {
          return const LoadingIndicator(
              indicatorType: Indicator.ballScale,
              colors: [Colors.blueAccent],
              backgroundColor: Colors.white,
              pathBackgroundColor: Colors.white);
        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text("Settings"),
          ),
          body: ListView(
            children: [
              const Card(
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Edit Profile'),
                  trailing: Icon(Icons.navigate_next),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.place),
                  title: const Text('Address'),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.address);
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    bloc.add(const LogoutEvent());
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
