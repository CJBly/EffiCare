# EffiCare
Efficare is an iOS mobile application built with SwiftUI and SwiftData that provides separate functionality for patients and healthcare providers. The application allows users to manage medical conditions, communicate through messages, view patient/provider information, and use location-based features to find nearby healthcare facilities.

## Features
### Patient
Patient account login and signup. 
View and manage medical conditions. 
Add new conditions - with description and severity slider. 
View condition details. 
Communicate with healthcare providers through messaging. 
View healthcare locations on a map. 
Manage profile information. 

### Healthcare Provider
Healthcare provider login. 
View a list of patients. 
View a patient's reported medical conditions. 
View detailed condition information. 
Communicate with patients through messaging. 
Access profile and healthcare-related information. 
View healthcare locations on a map. 

## Technologies
Swift 
SwiftUI – User interface 
SwiftData – Local data persistence
MapKit – Map functionality
CoreLocation – User location and location permissions
Xcode

## Test Accounts

Efficare automatically creates two test accounts when the application is first launched.
### Patient
Username: Patient1
Password: 1369

### Healthcare Provider
Username: Provider1
Password: abcd

These accounts are created for testing use.

## Running the Application
1. Open the Efficare project in Xcode.
2. Select an iOS Simulator.
3. Build and run the application.
4. Choose either Log in as Patient or Log in as Healthcare Provider.
5. Use one of the included test accounts above or create an account.

### Location Services / Simulator Setup

Efficare uses CoreLocation and MapKit for its mapping functionality. Location permissions may behave differently when running through the Xcode Simulator compared to a live app.
When testing the application please:
1. Run Efficare in the iOS Simulator.
2. Allow location access when the application requests permission.
3. If the application does not receive a location, make sure location simulation is enabled in Xcode.
4. In Xcode, select Debug → Location and choose a simulated location.
5. If LocationManager initially reports that location access is denied or the application does not continue correctly, stop/resume execution using the Continue (|>) button in Xcode and allow the location request when prompted.
6. Navigate to the map functionality after location access has been granted.

## Data Storage

The current version of Efficare does not require an external database or Firebase configuration. Application data is persisted locally using SwiftData.

The application's model context is also used to preload the test patient and healthcare provider on first launch. Existing users are checked before the test accounts are inserted to prevent duplicate test data.

## Known Current Limitations
Firebase integration is not currently implemented.
Data is stored locally with SwiftData and therefore is not synchronized between devices.
The application currently includes preset accounts primarily for demonstration and testing.
Authentication is intended for project/demo purposes and should not be considered production-ready healthcare authentication.
The application is a prototype and is not intended for handling real protected health information (PHI) without additional security, privacy, authentication, and backend infrastructure.
