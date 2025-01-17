import 'package:app_bloc/app_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceBadge extends StatefulWidget {
  const PriceBadge({super.key});

  @override
  State<PriceBadge> createState() => _PriceBadgeState();
}

class _PriceBadgeState extends State<PriceBadge> {


  @override
  void initState() {
    super.initState();
    context.read<BalanceCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceCubit,BalanceState>(
      builder: (context,state) {
        return SizedBox(
          height: 30,
          width: 50,
          child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(35),
              ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  state.maybeMap(
                    error: (e){
                      return Center(
                        child: Text(e.error),
                      );
                    },
                      orElse: (){return SizedBox.shrink();},
                    success: (data){
                        return CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            data.user.profileImage
                          ),
                        );
                    }
                  ),

                  5.horizontalSpace,
                  state.maybeMap(
                    success: (data){
                      return Text(data.balance.formatCompact, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 15
                      ),);
                    },
                      orElse: (){
                        return ShimmerView(
                            child: Text('data')
                        );
                      }
                  )

                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
