// Universal Variables
PImage FrogUp;
PImage FrogDown;
PImage FrogLeft;
PImage FrogRight;
PImage FrogLives;
PImage Car;
PImage Racecar;
PImage Log;
PImage Turtle;

float FrogX = 375;
float FrogY = 700;
float CarX = 0;
float Car2X = 300;
float Car3X = 600;
float SecondCarX = 200;
float SecondCar2X = 400;
float SecondCar3X = 700;
float ThirdCarX = 100;
float ThirdCar2X = 500;
float ThirdCar3X = 800;
float CarSpeed = -2;
float SecondCarSpeed = -3;
float ThirdCarSpeed = -2.5;
float RacecarX = 100;
float Racecar2X = 400;
float SecondRacecarX = 500;
float SecondRacecar2X = 0;
float RacecarSpeed = 5;
float LogX = 0;
float Log2X = 300;
float Log3X = 600;
float LogSpeed = 2;
float SecondLogX = 0;
float SecondLog2X = 600;
float SecondLogSpeed = 3;
float ThirdLogX = 0;
float ThirdLog2X = 300;
float ThirdLog3X = 600;
float ThirdLogSpeed = 2.5;
float TurtleX = 0;
float Turtle2X = 350;
float Turtle3X = 700;
float SecondTurtleX = 0;
float SecondTurtle2X = 500;
float TurtleSpeed = -3;
int FrogDirection = 1;
int score = 0;
int lives = 3;
int startTime;
int remainingTime = 61;
boolean isMoving = false; // Variable to track whether the frog is moving or not
boolean isOnTurtleOrLog = false; // Variable to track whether the frog is on a turtle or log
boolean gamestarts = false;
boolean Home = true;
boolean Lives = false;
boolean Won = false;

// Variables to track whether the frog is on an end zone square
boolean isOnEndZone = false;
boolean isOnEndZone1;
boolean isOnEndZone2;
boolean isOnEndZone3;
boolean isOnEndZone4;
boolean isOnEndZone5;

void setup() {
  startTime = millis();
  size(800, 800);
  FrogUp = loadImage("FrogUp.png");
  FrogDown = loadImage("FrogDown.png");
  FrogLeft = loadImage("FrogLeft.png");
  FrogRight = loadImage("FrogRight.png");
  FrogLives = loadImage("FrogLives.png");
  Car = loadImage("Car.png");
  Racecar = loadImage("Racecar.png");
  Log = loadImage("Log.png");
  Turtle = loadImage("Turtle.png");
}

void keyPressed() {
  if (key == 'p') { // Begin game
    lives = 3;
    score = 0;
    remainingTime = 46;
    gamestarts = true;
    Home = false;
  }
  if (key == 'h') { // Return home
    Home = true;
    gamestarts = false;
    Won = false;
  }
}

void draw() {
  // Home Display
  if (Home == true) {
    lives = 3;
    fill(0);
    rect(0, 0, 800, 800);
    fill(#FF0000);
    textSize(64);
    text("Welcome to Frogger!", 110, 100);
    fill(#FFA500);
    textSize(50);
    text("Press p to play!", 230, 200);
    fill(#FFFF00);
    textSize(40);
    text("Instructions: Move the frog using", 90, 350);
    text("wasd controls. The goal of the game", 90, 400);
    text("is to get to the 5 orange zones by", 90, 450);
    text("avoiding cars and jumping onto", 90, 500);
    text("turtles and logs. Avoid the river", 90, 550);
    text("and the toxic zone surrounding the", 90, 600);
    text("end zones. Good luck, and have fun!", 90, 650);
  }

  if (Home == false && gamestarts == true) {
    background(255);
    // Points
    noStroke();
    fill(#1A1110);
    rect(0, 0, 800, 50);
    textSize(32);
    fill(255);
    text("POINTS: " + score, 30, 35);

    // Time
    fill(#1A1110);
    rect(0, 750, 800, 50);
    if (millis() - startTime >= 1000) {
      startTime = millis();
      remainingTime--;
    }
    if (remainingTime == 0) {
      Lives = true;
      remainingTime += 46;
    }
    textSize(32);
    fill(255);
    text("TIME: " + remainingTime, 30, 785);

    // Safe Zones
    fill(#006400);
    rect(0, 700, 800, 50);
    rect(0, 400, 800, 50);

    // Roads
    fill(#807e78);
    rect(0, 450, 800, 250);

    // Road Lines
    int j = 500;
    while (j < 651) {
      strokeWeight(1);
      stroke(255);
      line(0, j, 800, j);
      j = j + 50;
    }

    // Car
    Car.resize(50, 50); // Resizing the car

    // First row of cars
    image(Car, CarX, 450);
    CarX += CarSpeed;
    if (CarX < -50) {
      CarX = width + 25;
    }
    image(Car, Car2X, 450);
    Car2X += CarSpeed;
    if (Car2X < -50) {
      Car2X = width + 25;
    }
    image(Car, Car3X, 450);
    Car3X += CarSpeed;
    if (Car3X < -50) {
      Car3X = width + 25;
    }

    // Second row of cars
    image(Car, SecondCarX, 550);
    SecondCarX += SecondCarSpeed;
    if (SecondCarX < -50) {
      SecondCarX = width + 25;
    }
    image(Car, SecondCar2X, 550);
    SecondCar2X += SecondCarSpeed;
    if (SecondCar2X < -50) {
      SecondCar2X = width + 25;
    }
    image(Car, SecondCar3X, 550);
    SecondCar3X += SecondCarSpeed;
    if (SecondCar3X < -50) {
      SecondCar3X = width + 25;
    }

    // Third row of cars
    image(Car, ThirdCarX, 650);
    ThirdCarX += ThirdCarSpeed;
    if (ThirdCarX < -50) {
      ThirdCarX = width + 25;
    }
    image(Car, ThirdCar2X, 650);
    ThirdCar2X += ThirdCarSpeed;
    if (ThirdCar2X < -50) {
      ThirdCar2X = width + 25;
    }
    image(Car, ThirdCar3X, 650);
    ThirdCar3X += ThirdCarSpeed;
    if (ThirdCar3X < -50) {
      ThirdCar3X = width + 25;
    }

    // Racecar
    Racecar.resize(50, 50); // Resizing the racecar

    // First row of racecars
    image(Racecar, RacecarX, 500);
    RacecarX += RacecarSpeed;
    if (RacecarX > width) {
      RacecarX = -150;
    }
    image(Racecar, Racecar2X, 500);
    Racecar2X += RacecarSpeed;
    if (Racecar2X > width) {
      Racecar2X = -150;
    }


    // Second row of racecars
    image(Racecar, SecondRacecarX, 600);
    SecondRacecarX += RacecarSpeed;
    if (SecondRacecarX > width) {
      SecondRacecarX = -150;
    }
    image(Racecar, SecondRacecar2X, 600);
    SecondRacecar2X += RacecarSpeed;
    if (SecondRacecar2X > width) {
      SecondRacecar2X = -150;
    }

    // River
    noStroke();
    fill(#2B65EC);
    rect(0, 150, 800, 250);

    // Logs
    Log.resize(50, 50); // Resizing the log

    // First row of logs
    int k = 0;
    while (k < 106) {
      image(Log, LogX+k, 150);
      k += 15;
    }
    LogX += LogSpeed;
    if (LogX > width+105) {
      LogX = -200;
    }
    int k2 = 0;
    while (k2 < 106) {
      image(Log, Log2X+k2, 150);
      k2 += 15;
    }
    Log2X += LogSpeed;
    if (Log2X > width+105) {
      Log2X = -200;
    }
    int k3 = 0;
    while (k3 < 106) {
      image(Log, Log3X+k3, 150);
      k3 += 15;
    }
    Log3X += LogSpeed;
    if (Log3X > width+105) {
      Log3X = -200;
    }

    // Second row of logs
    int l = 0;
    while (l < 176) {
      image(Log, SecondLogX+l, 250);
      l += 15;
    }
    SecondLogX += SecondLogSpeed;
    if (SecondLogX > width+175) {
      SecondLogX = -250;
    }
    int l2 = 0;
    while (l2 < 176) {
      image(Log, SecondLog2X+l2, 250);
      l2 += 15;
    }
    SecondLog2X += SecondLogSpeed;
    if (SecondLog2X > width+175) {
      SecondLog2X = -250;
    }

    // Third row of logs
    int m = 0;
    while (m < 71) {
      image(Log, ThirdLogX+m, 300);
      m += 15;
    }
    ThirdLogX += ThirdLogSpeed;
    if (ThirdLogX > width+70) {
      ThirdLogX = -150;
    }
    int m2 = 0;
    while (m2 < 71) {
      image(Log, ThirdLog2X+m2, 300);
      m2 += 15;
    }
    ThirdLog2X += ThirdLogSpeed;
    if (ThirdLog2X > width+70) {
      ThirdLog2X = -150;
    }
    int m3 = 0;
    while (m3 < 71) {
      image(Log, ThirdLog3X+m3, 300);
      m3 += 15;
    }
    ThirdLog3X += ThirdLogSpeed;
    if (ThirdLog3X > width+70) {
      ThirdLog3X = -150;
    }

    // Turtles
    Turtle.resize(50, 50); // Resizing the turtle

    // First row of turtles
    image(Turtle, TurtleX, 200);
    image(Turtle, TurtleX-50, 200);
    TurtleX += TurtleSpeed;
    if (TurtleX < -50) {
      TurtleX = width + 200;
    }
    image(Turtle, Turtle2X, 200);
    image(Turtle, Turtle2X-50, 200);
    Turtle2X += TurtleSpeed;
    if (Turtle2X < -50) {
      Turtle2X = width + 200;
    }
    image(Turtle, Turtle3X, 200);
    image(Turtle, Turtle3X-50, 200);
    Turtle3X += TurtleSpeed;
    if (Turtle3X < -50) {
      Turtle3X = width + 200;
    }

    // Second row of turtles
    image(Turtle, SecondTurtleX, 350);
    image(Turtle, SecondTurtleX-50, 350);
    image(Turtle, SecondTurtleX-100, 350);
    SecondTurtleX += TurtleSpeed;
    if (SecondTurtleX < -100) {
      SecondTurtleX = width + 300;
    }
    image(Turtle, SecondTurtle2X, 350);
    image(Turtle, SecondTurtle2X-50, 350);
    image(Turtle, SecondTurtle2X-100, 350);
    SecondTurtle2X += TurtleSpeed;
    if (SecondTurtle2X < -100) {
      SecondTurtle2X = width + 300;
    }

    // Toxic Zones
    fill(#FFDF00);
    rect(0, 50, 800, 100);

    // End Zones
    int i = 25;
    while (i < 706) {
      fill(#FF8C00);
      rect(i, 100, 70, 50);
      i = i + 170;
    }
    if (isOnEndZone1) {
      FrogUp.resize(50, 50);
      image(FrogUp, 35, 100);
    }
    if (isOnEndZone2) {
      FrogUp.resize(50, 50);
      image(FrogUp, 205, 100);
    }
    if (isOnEndZone3) {
      FrogUp.resize(50, 50);
      image(FrogUp, 375, 100);
    }
    if (isOnEndZone4) {
      FrogUp.resize(50, 50);
      image(FrogUp, 545, 100);
    }
    if (isOnEndZone5) {
      FrogUp.resize(50, 50);
      image(FrogUp, 715, 100);
    }

    // Scoring system
    if (isOnEndZone1 || isOnEndZone2 || isOnEndZone3 || isOnEndZone4 || isOnEndZone5) {
      if (isOnEndZone) {
        score += 100;
        isOnEndZone = false;
      }
    }

    // Collision Detection

    // Cars
    if (FrogX < CarX + 50 && FrogX + 50 > CarX && FrogY < 500 && 50 + FrogY > 450 ||
      FrogX < Car2X + 50 && FrogX + 50 > Car2X && FrogY < 500 && 50 + FrogY > 450 ||
      FrogX < Car3X + 50 && FrogX + 50 > Car3X && FrogY < 500 && 50 + FrogY > 450 ||
      FrogX < SecondCarX + 50 && FrogX + 50 > SecondCarX && FrogY < 600 && 50 + FrogY > 550 ||
      FrogX < SecondCar2X + 50 && FrogX + 50 > SecondCar2X && FrogY < 600 && 50 + FrogY > 550 ||
      FrogX < SecondCar3X + 50 && FrogX + 50 > SecondCar3X && FrogY < 600 && 50 + FrogY > 550 ||
      FrogX < ThirdCarX + 50 && FrogX + 50 > ThirdCarX && FrogY < 700 && 50 + FrogY > 650 ||
      FrogX < ThirdCar2X + 50 && FrogX + 50 > ThirdCar2X && FrogY < 700 && 50 + FrogY > 650 ||
      FrogX < ThirdCar3X + 50 && FrogX + 50 > ThirdCar3X && FrogY < 700 && 50 + FrogY > 650 ||
      // Racecars
      FrogX < RacecarX + 50 && FrogX + 50 > RacecarX && FrogY < 550 && 50 + FrogY > 500 ||
      FrogX < Racecar2X + 50 && FrogX + 50 > Racecar2X && FrogY < 550 && 50 + FrogY > 500 ||
      FrogX < SecondRacecarX+50 && FrogX + 50 > SecondRacecarX && FrogY < 650 && 50 + FrogY > 600 ||
      FrogX < SecondRacecar2X+50 && FrogX + 50 > SecondRacecar2X && FrogY < 650 && 50 + FrogY > 600) {
      FrogDirection = 1;
      resetFrog();
    }

    // When the frog is in the river
    if (FrogY >= 150 && FrogY < 400) {
      isOnTurtleOrLog = false;
    }

    // When the frog is on a turtle or a log
    if (FrogY == 150 && FrogX > LogX-40 && FrogX < LogX+125 ||
      FrogY == 150 && FrogX > Log2X-40 && FrogX < Log2X+125 ||
      FrogY == 150 && FrogX > Log3X-40 && FrogX < Log3X+125) {
      FrogX += LogSpeed;
      isOnTurtleOrLog = true;
    }
    if (FrogY == 250 && FrogX > SecondLogX-50 && FrogX < SecondLogX+200 ||
      FrogY == 250 && FrogX > SecondLog2X-50 && FrogX < SecondLog2X+200) {
      FrogX += SecondLogSpeed;
      isOnTurtleOrLog = true;
    }
    if (FrogY == 300 && FrogX > ThirdLogX-50 && FrogX < ThirdLogX+80 ||
      FrogY == 300 && FrogX > ThirdLog2X-50 && FrogX < ThirdLog2X+80 ||
      FrogY == 300 && FrogX > ThirdLog3X-50 && FrogX < ThirdLog3X+80) {
      FrogX += ThirdLogSpeed;
      isOnTurtleOrLog = true;
    }
    if (FrogY == 200 && FrogX > TurtleX-75 && FrogX < TurtleX+25 ||
      FrogY == 200 && FrogX > Turtle2X-75 && FrogX < Turtle2X+25 ||
      FrogY == 200 && FrogX > Turtle3X-75 && FrogX < Turtle3X+25 ||
      FrogY == 350 && FrogX > SecondTurtleX-125 && FrogX < SecondTurtleX+25 ||
      FrogY == 350 && FrogX > SecondTurtle2X-125 && FrogX < SecondTurtle2X+25) {
      FrogX += TurtleSpeed;
      isOnTurtleOrLog = true;
    }

    // If the frog is in the river and not on a turtle or log, move it back to the respawn position
    if (FrogX > -50 && FrogX < 800 && FrogY >= 150 && FrogY < 400 && !isOnTurtleOrLog ||
      FrogX < -25 || FrogX > width || FrogY < 0 || FrogY > height - 100) {  // Game Boundaries
      FrogDirection = 1;
      resetFrog();
    }

    // If the frog is on EndZone or ToxicZone
    if (FrogY < 150) {
      // If the frog is on the 1st end zone
      if (FrogX >= 25 && FrogX <= 95 && FrogY < 150) {
        FrogDirection = 1;
        isOnEndZone1 = true;
        isOnEndZone = true;
        reset();
      }
      // If the frog is on the 2nd end zone
      if (FrogX >= 195 && FrogX <= 265 && FrogY < 150) {
        FrogDirection = 1;
        isOnEndZone2 = true;
        isOnEndZone = true;
        reset();
      }
      // If the frog is on the 3rd end zone
      if (FrogX >= 365 && FrogX <= 435 && FrogY < 150) {
        FrogDirection = 1;
        isOnEndZone3 = true;
        isOnEndZone = true;
        reset();
      }
      // If the frog is on the 4th end zone
      if (FrogX >= 535 && FrogX <= 605 && FrogY < 150) {
        FrogDirection = 1;
        isOnEndZone4 = true;
        isOnEndZone = true;
        reset();
      }
      // If the frog is on the 5th end zone
      if (FrogX >= 705 && FrogX <= 775 && FrogY < 150) {
        FrogDirection = 1;
        isOnEndZone5 = true;
        isOnEndZone = true;
        reset();
      }
      // If the frog is on the toxic zone
      if (FrogY < 150) {
        FrogDirection = 1;
        resetFrog();
      }
    }

    if (keyPressed && !isMoving) { // Check if a key is being pressed and the frog is not currently moving
      if (key == 'w' || key == 'W') {
        FrogY -= 50;
        FrogDirection = 1;
        isMoving = true; // Set isMoving to true to indicate that the frog is currently moving
        score += 10;
      } else if (key == 'a' || key == 'A') {
        FrogX -= 50;
        FrogDirection = 2;
        isMoving = true;
      } else if (key == 's' || key == 'S') {
        FrogY += 50;
        FrogDirection = 3;
        isMoving = true;
        if (score != 0) {
          score -= 10;
        }
      } else if (key == 'd' || key == 'D') {
        FrogX += 50;
        FrogDirection = 4;
        isMoving = true;
      }
    } else if (!keyPressed) {
      isMoving = false; // Set isMoving to false if no key is being pressed
    }

    // Draw the frog facing the appropriate direction
    if (FrogDirection == 1) {
      FrogUp.resize(50, 50);
      image(FrogUp, FrogX, FrogY);
    } else if (FrogDirection == 2) {
      FrogLeft.resize(50, 50);
      image(FrogLeft, FrogX, FrogY);
    } else if (FrogDirection == 3) {
      FrogDown.resize(50, 50);
      image(FrogDown, FrogX, FrogY);
    } else if (FrogDirection == 4) {
      FrogRight.resize(50, 50);
      image(FrogRight, FrogX, FrogY);
    }

    // Lives
    FrogLives.resize(25, 25);
    image(FrogLives, 650, 765);
    image(FrogLives, 700, 765);
    image(FrogLives, 750, 765);
    fill(#1A1110);
    if (lives == 2) {
      rect(650, 765, 25, 25);
      image(FrogLives, 700, 765);
      image(FrogLives, 750, 765);
    }
    if (lives == 1) {
      rect(650, 765, 25, 25);
      rect(700, 765, 25, 25);
      image(FrogLives, 750, 765);
    }
    if (lives == 0) {
      Lives = true;
    }
    if (Lives == true) {
      rect(650, 765, 25, 25);
      rect(700, 765, 25, 25);
      rect(750, 765, 25, 25);
      fill(0);
      rect(0, 0, 800, 800);
      textSize(64);
      fill(#FFFF00);
      text("Game Over!", 250, 300);
      text("Points: " + score, 400, 550);
      fill(#0000FF);
      textSize(32);
      text("Press p to play again!", 260, 400);
      fill(#800080);
      text("Press h to return home.", 250, 450);
      Lives = false;
      gamestarts = false;
      isOnEndZone1 = false;
      isOnEndZone2 = false;
      isOnEndZone3 = false;
      isOnEndZone4 = false;
      isOnEndZone5 = false;
    }
    if (isOnEndZone1 && isOnEndZone2 && isOnEndZone3 && isOnEndZone4 && isOnEndZone5) {
      Won = true;
    }
    if (Won == true) {
      rect(650, 765, 25, 25);
      rect(700, 765, 25, 25);
      rect(750, 765, 25, 25);
      fill(0);
      rect(0, 0, 800, 800);
      textSize(64);
      fill(#FFFF00);
      text("You Won!", 250, 300);
      text("Points: " + score, 400, 550);
      fill(#0000FF);
      textSize(32);
      text("Press p to play again!", 260, 400);
      fill(#800080);
      text("Press h to return home.", 250, 450);
      Won = false;
      gamestarts = false;
      isOnEndZone1 = false;
      isOnEndZone2 = false;
      isOnEndZone3 = false;
      isOnEndZone4 = false;
      isOnEndZone5 = false;
    }
  }
}
void resetFrog() {
  FrogX = 375;
  FrogY = 700;
  lives -= 1;
}

void reset() {
  FrogX = 375;
  FrogY = 700;
}
