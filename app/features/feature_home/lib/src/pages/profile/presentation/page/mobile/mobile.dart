
part of '../../profile_page.dart';

class _Mobile extends StatefulWidget {
  const _Mobile();

  @override
  State<_Mobile> createState() => Mobile();
}

class Mobile extends State<_Mobile> {

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().init();
    context.read<TypeBloc>().get();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider<TypeBloc>(
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
  const _Driver();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color.fromRGBO(23,103,57,1.000),
                Color.fromRGBO(42,190,105,1.000),
              ]
            )
          ),
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
          ),
        )
    );
  }
  Future<void> navigateAuthPage() async{
    return NavigationUtils.getMainNavigator().navigateAuthPage();
  }
}
