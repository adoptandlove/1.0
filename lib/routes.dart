import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getpet/components/preferences/preferences_component.dart';
import 'components/home/home_component.dart';
import 'components/onboarding/onboarding_component.dart';
import 'components/pet_profile/full_screen_images_component.dart';
import 'components/pet_profile/pet_profile.dart';
import 'components/shelter_pet/shelter_pet_component.dart';
import 'components/user_profile/user_login_component.dart';
import 'pets.dart';

class Routes {
  static const ROUTE_HOME = "home_screen";
  static const ROUTE_ONBOARDING = "onboarding_screen";

  static const ROUTE_PET_PROFILE = "pet_profile_screen";
  static const ROUTE_FULL_SCREEN_IMAGE = "full_screen_image_screen";

  static const ROUTE_SHELTER_PET = "shelter_pet_screen";
  static const ROUTE_USER_LOGIN_FULLSCREEN = "user_login_fullscreen_screen";

  static const ROUTE_PREFERENCES = "preferences_screen";
  static const ROUTE_LOGIN = "login";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_HOME:
        return MaterialPageRoute(builder: (context) {
          return HomeComponent();
        });
      case ROUTE_ONBOARDING:
        return MaterialPageRoute(builder: (context) {
          return OnboardingComponent();
        });
      case ROUTE_USER_LOGIN_FULLSCREEN:
        return MaterialPageRoute(builder: (context) {
          return UserLoginFullscreenComponent(
            popOnLoginIn: true,
          );
        });
      case ROUTE_PET_PROFILE:
        final Pet pet = settings.arguments;

        return MaterialPageRoute(builder: (context) {
          return PetProfileComponent(pet: pet);
        });
      case ROUTE_FULL_SCREEN_IMAGE:
        final FullScreenImageScreenArguments arguments = settings.arguments;

        return MaterialPageRoute(builder: (context) {
          return FullScreenImageScreen(
            name: arguments.name,
            photos: arguments.photos,
            initialIndex: arguments.initialIndex,
          );
        });
      case ROUTE_SHELTER_PET:
        final Pet pet = settings.arguments;

        return MaterialPageRoute(builder: (context) {
          return ShelterPetComponent(pet: pet);
        });
      case ROUTE_PREFERENCES:
        return MaterialPageRoute(builder: (context) {
          return PreferencesComponent();
        });
      case ROUTE_LOGIN:
        return MaterialPageRoute(builder: (context) {
          return LoginPage();
        });
      default:
        throw Exception("Unable to find route ${settings.name} in routes");
    }
  }
}
