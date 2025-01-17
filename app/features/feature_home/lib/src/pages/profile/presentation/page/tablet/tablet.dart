part of '../../profile_page.dart';

class _Tablet extends StatelessWidget {
  const _Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondary,
      child: CustomScrollView(
        slivers: [
          // const HeaderProfilePage().toBoxAdapter(),
          SliverFillRemaining(
            hasScrollBody: true,
            child: _buildMainContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left panel with fixed width
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.5,
            child: SingleChildScrollView(
              child: _buildLeftPanel(context),
            ),
          ),
          // Right panel with payment history that expands
          Expanded(
            child: _buildPaymentHistory(context),
          ),
        ],
      ),
    );
  }


  Widget _buildLeftPanel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 30),
          _buildBalanceCard(context),
          const SizedBox(height: 30),
          _buildActionButtons(context),
          const SizedBox(height: 20),
          _buildContactInfo(context),
          const SizedBox(height: 20),
          _buildExitButton(context),
          const SizedBox(height: 30),
        ],
      ),
    );
  }


  Widget _buildBalanceCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () => {},
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: _BalanceCardContent(colorScheme: colorScheme),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        _ActionButton(
          icon: AppIcons.bell02,
          label: LocaleKeys.notifications.tr(context: context),
          onTap: () {},
        ),
        const SizedBox(height: 10),
        _ActionButton(
          icon: AppIcons.globe01,
          label: LocaleKeys.language.tr(context: context),
          onTap: () => ChangeLanguageSheet.show(context),
        ),
        const SizedBox(height: 10),
        _ActionButton(
          icon: AppIcons.settings,
          label: LocaleKeys.settings.tr(context: context),
          onTap: () => _navigateToSettings(context),
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * 0.1,
          ),
          child: Text(
            LocaleKeys.contactPhoneNumber.tr(context: context),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: 5),
        _PhoneNumberCard(),
      ],
    );
  }

  Widget _buildExitButton(BuildContext context) {
    return EcoButton(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: 55,
      onPressed: () {},
      child: Text(LocaleKeys.exit.tr(context: context)),
    );
  }

  Widget _buildPaymentHistory(BuildContext context) {
    final payments = _getTestPaymentHistory();
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0,top: 25),
            child: Text(LocaleKeys.payments.tr(context: context),style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 25,
            ),),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: payments.length,
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Divider(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
              itemBuilder: (context, index) => SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  List<PaymentHistory> _getTestPaymentHistory() {
    return [
      PaymentHistory(
        date: DateTime(2024, 9, 17, 14, 30),
        description: "Grocery shopping",
        amount: -50000,
      ),
      PaymentHistory(
        date: DateTime(2024, 9, 17, 14, 30),
        description: "Grocery shopping",
        amount: -50000,
      ),
    ];
  }

  Future<void> _navigateToAccount(BuildContext context) async {
    await NavigationUtils.getMainNavigator().navigateMyAccountPage();
  }

  Future<void> _navigateToSettings(BuildContext context) async {
    await NavigationUtils.getMainNavigator().navigateSettingsPage();
  }
}

class _BalanceCardContent extends StatelessWidget {
  final ColorScheme colorScheme;

  const _BalanceCardContent({required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: colorScheme.surface,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBalanceSection(
            context,
            icon: AppIcons.arrowUp,
            amount: '9 255 549',
          ),
          VerticalDivider(
            color: colorScheme.surface,
            thickness: 1,
            width: 20,
          ),
          _buildBalanceSection(
            context,
            icon: AppIcons.arrowDown,
            amount: '10 000 000',
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceSection(
      BuildContext context, {
        required String icon,
        required String amount,
      }) {
    return Row(
      children: [
        const SizedBox(width: 10),
        SvgPicture.asset(icon, color: colorScheme.primary),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lorem ipsum',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontSize: 10),
            ),
            Text(
              amount,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: context.colorScheme.surface,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 15),
            SvgPicture.asset(
              icon,
              color: context.colorScheme.primary,
            ),
            const SizedBox(width: 15),
            Expanded(child: Text(label)),
          ],
        ),
      ),
    );
  }
}

class _PhoneNumberCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: colorScheme.surface,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          SvgPicture.asset(
            AppIcons.phone,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 10),
          const Text('+998 95-778-56-57'),
        ],
      ),
    );
  }
}