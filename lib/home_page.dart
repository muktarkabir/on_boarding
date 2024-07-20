import 'package:flutter/material.dart';
import 'register_page.dart';
import 'create_profile_page.dart';
import 'confirm_details_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('R E G I S T R A T I O N'),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Stepper(
        type: StepperType.horizontal,
        elevation: 2.0,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: () {
          final isLastStep = (currentStep == getSteps().length - 1);
          if (isLastStep) {
            return;
          } else {
            setState(() {
              currentStep++;
            });
          }
        },
        onStepCancel: () {
          if (currentStep == 0) {
            return;
          } else {
            setState(() {
              currentStep--;
            });
          }
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Container(
            margin: const EdgeInsets.only(top: 50.0),
            child: Row(
              children: [
                if (currentStep != 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepCancel,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                const SizedBox(
                  width: 12.0,
                ),
                if (currentStep != 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          title: const Text('Account details'),
          content: RegisterPage(
            nextStep: () => setState(() => currentStep = 1),
          ),
          isActive: currentStep >= 0,
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          title: const Text('Profile Details'),
          content: const CreateProfilePage(),
          isActive: currentStep >= 1,
        ),
        Step(
          title: const Text('Complete'),
          content: const ConfirmDetailsPage(),
          isActive: currentStep >= 2,
        ),
      ];
}
