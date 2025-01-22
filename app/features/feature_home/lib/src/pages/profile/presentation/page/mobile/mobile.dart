
part of '../../profile_page.dart';

class _Mobile extends StatefulWidget {
  const _Mobile({super.key});

  @override
  State<_Mobile> createState() => Mobile();
}

class Mobile extends State<_Mobile> {

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<TypeBloc>(
        create: (context)=> AppBlocHelper.getTypeBloc(),
        child: BlocBuilder<TypeBloc,AuthTypeState>(
          builder: (context,state) {
            print('STATE: $state');
            if(state is Init){
              return Center(
                child: Text("Loading"),
              );
            }else if(state is Fail){
              return Center(
                child: Text('state.message'),
              );
            }else if(state is PartnerType){
              return _PartnerMobile();
            }else if(state is DriverType){
              return _Driver();
            }else{
              return Center(
                child: Text("Error"),
              );
            }
            // return PartnerOrDriver(
            //     re: (context,type){
            //       print(type);
            //       if(type == AuthType.partner){
            //         return _PartnerMobile();
            //       }else{
            //         return _Driver();
            //       }
            //     }
            // );
          }
        ),
      ),
    );
  }

}

class _Driver extends StatelessWidget {
  const _Driver({super.key});

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
                      user: (driver,partner) => _ProfileWidget(userProfile: driver!,),
                      error: (String error) => Center(
                        child: Text(error),
                      ),
                      loading: () => Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                      orElse: ()=> Center(
                        child: Text("DRIVER ERROR"),
                      )
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
