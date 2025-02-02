part of '../../profile_page.dart';

class _PartnerMobile extends StatefulWidget {
  const _PartnerMobile();

  @override
  State<_PartnerMobile> createState() => PartnerMobile();
}

class PartnerMobile extends State<_PartnerMobile> {

  @override
  void initState() {
    context.read<ProfileCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme
            .of(context)
            .colorScheme
            .secondary,
        child: BlocListener<LogoutCubit, LogoutState>(
          listener: (context, state) {
            state.maybeWhen(
                orElse: (){},
                error: (s){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
                },
                success: (){
                  navigateAuthPage();
                }
            );
          },
          child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: state.maybeWhen(
                      user: (driver,partner) => _PartnerProfileWidget(partner: partner,),
                      error: (String error) => _PartnerProfileWidget(),
                      loading: () => ShimmerView(child: _PartnerProfileWidget()),
                      orElse: SizedBox.shrink
                  ),
                );
              }
          ),
        )
    );
  }

  Future<void> navigateAuthPage() async{
    return NavigationUtils.getMainNavigator().navigateAuthPage();
  }

}
