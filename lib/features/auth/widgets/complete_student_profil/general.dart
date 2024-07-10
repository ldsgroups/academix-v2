import 'package:academix/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GeneralInfo extends HookConsumerWidget {
  const GeneralInfo({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _generalFormKey = GlobalKey<FormState>();

    final genderController = useTextEditingController();
    final phoneController = useTextEditingController();
    final countryController = useTextEditingController();
    final cityController = useTextEditingController();

    const fullName = 'Darius Kassi';

    return SingleChildScrollView(
      child: Column(
        children: [
          const Badge(
            label: Text(
              'Général',
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
            largeSize: 28,
            padding: EdgeInsets.symmetric(horizontal: 20),
          ),
          const SizedBox(height: 40),
          Text(
            'Nous voulons mieux vous connaître'.toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 10),
          Text(
            'Bonjour $fullName, dites nous plus sur vous',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Form(
            key: _generalFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  CsTextFormField(
                    controller: genderController,
                    hintText: 'Genre',
                  ),
                  const SizedBox(height: 12),
                  CsDropdownButtonFormField<String>(
                    hintText: 'Sexe',
                    items: const [
                      DropdownMenuItem(value: 'boy', child: Text('Homme')),
                      DropdownMenuItem(
                        value: 'girl',
                        child: Text('Femme'),
                      ),
                    ],
                    onChanged: (newGender) {
                      if (newGender != null) {
                        genderController.text = newGender;
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  CsTextFormField(
                    controller: phoneController,
                    hintText: 'Numéro de téléphone',
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      PhoneNumberTextInputFormatter('## ## ## ####'),
                    ],
                    validator: (p0) {
                      if (p0 != null && p0.isNotEmpty) {
                        final rightLengthRes =
                            p0.hasMinLength(8) && p0.hasMaxLength(15);
                        if (!rightLengthRes) {
                          return 'Il faut un numéro ivoirien (10 chiffres)';
                        }

                        final goodCIVNumberProvider =
                            p0.startsWith(RegExp('^(01|05|07|27)'));
                        if (!goodCIVNumberProvider) {
                          return "Ce numéro n'est pas un bon numéro ivoirien";
                        }

                        return null;
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  CsTextFormField(
                    controller: countryController,
                    hintText: 'Pays',
                  ),
                  const SizedBox(height: 12),
                  CsTextFormField(
                    controller: cityController,
                    hintText: 'Ville',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
