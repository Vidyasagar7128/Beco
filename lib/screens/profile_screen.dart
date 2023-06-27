import 'package:beco/services/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              Switch.adaptive(
                  thumbIcon: MaterialStateProperty.all<Icon>(
                      (const Icon(Icons.dark_mode))),
                  activeColor: Colors.white,
                  value: state,
                  onChanged: (val) {
                    BlocProvider.of<ThemeCubit>(context).toggleTheme();
                  }),
            ],
          ),
          body: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    GreetingTile(),
                    SizedBox(height: 16),
                    MerchentCard(),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: _buildCardsRow(context),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SettingTile(
                  icon: Icons.settings, onTap: () {}, title: 'User Profile'),
              SettingTile(
                  icon: Icons.settings, onTap: () {}, title: 'Settings'),
              SettingTile(
                  icon: Icons.settings,
                  onTap: () {},
                  title: 'Privacy & Policy'),
              SettingTile(
                  icon: Icons.settings, onTap: () {}, title: 'About Us'),
              SettingTile(icon: Icons.logout, onTap: () {}, title: 'Log out'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCardsRow(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCard(context, 'Bookings'),
        _buildCard(context, 'Favorites'),
        _buildCard(context, 'History'),
      ],
    );
  }

  Widget _buildCard(BuildContext context, String text) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          onTap: () {},
          child: Container(
            width: 110,
            height: 140,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  //alignment: Alignment.center,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).iconTheme.color,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GreetingTile extends StatelessWidget {
  const GreetingTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Hello Gaikwad',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text('Wel Come Back',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              )),
      trailing: IconButton(
        onPressed: () => Navigator.pushNamed(context, '/primeUser'),
        icon: Icon(
          Icons.notifications,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}

class MerchentCard extends StatelessWidget {
  const MerchentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).iconTheme.color,
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'If you have rooms',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
                Text(
                  'Become merchant',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                ),
              ],
            ),
            IconButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white)),
              onPressed: () {},
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final String title;
  const SettingTile(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
