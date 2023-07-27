# Overview
This project can place homeowners into neighborhoods based on their preferences. It does this by calculating a score based on their energy, water, and resilience preferences as well as their overall preference for a given neighborhood. Homeowners are placed based on their overall score.

# Algorithm
## Score Calcluation
The score for each homeowner and neighborhood pair is calculated by:
```
score =
    homeowner.energy * neighborhood.energy +
    homeowner.water * neighborhood.water +
    homeowner.resilience * neighborhood.resilience
```
The score is then multiplied based on the homeowners preference order for that neighborhood. For example, if a homeowner has a preference order of [A, B, C] the A neighborhood as a 3x multiplier, then 2x for B and 3x for C.

## Placement Approach
After the score is calculated for each neighborhood, homeowner pair, the algorithm starts with the first neighborhood and selects the top 3 scores, then the second and selects from the remaining top 3 scores, then the third and so on.

## Considerations
This approach is simple because each neighborhood is only considered once but it also places preference on the lower-numbered neighborhoods in the sequence (i.e. the first neighborhood gets the top 3 scores overall while the second gets the top 3 from the remaining set and so on).

# Features
All features are in the `lib/` folder.

## `assets`
Manages project assets such as an example input file.

## `placement`
Contains the main algorithm for placing homeowners into neighborhoods. Includes the following components:
* `repo`: The repository layer component that loads the input and runs the placement algorithm.
* `bloc`: Contains the business logic component that communicates the repositories activities to the UI.
* `model`: contains necessary domain models for the placement algorithm.
* `ui`: contains a placement form to enter input and output page to display the progress of the running algorithm.

# Tests
The `test/` folder has basic unit tests for the `PlacementRepository` including a `loadInput()` test and a `place` test.