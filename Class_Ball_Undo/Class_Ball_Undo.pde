color blue = color(20, 80, 255);
color pink = color(255, 100, 150);
color orange = color(255, 150, 80);
color white = color(255);

color[] colors = {blue, pink, orange};

float sum;
boolean check;

class Ball {
  float position_x, position_y;
  int size;
  int shade;

  Ball(float tempx, float tempy, int tempSize, int tempColor) {
    position_x = tempx;
    position_y = tempy;
    size = tempSize;
    shade = tempColor;
  }

  void draw() {
      fill(colors[shade]);
      ellipse(position_x, position_y, size, size);
  }

  float getArea() {
    float area = 22/7 * (size/2) * (size/2);
    return area;
  }
}

//Ball[] balls = new Ball[int(random(3,8))];
Ball[] balls = new Ball[4];

void setup() {
  size(400, 400);
  for (int i = 0; i < balls.length; i++) {
    int tempColor = int(random(colors.length));
    balls[i] = new Ball(int(random(250)), int(random(250)), int(random(50,100)), tempColor);
  }
  for (Ball ball : balls) {
    sum += ball.getArea();
  }
  println("Sum of all area is : ", sum);
}

void draw() {
  delay(200);
  background(white);
  for (Ball ball : balls) {
    ball.draw();
  }
  
  Ball[] lsball1;
  Ball[] lsball2;
  Ball[] lsball3;
  
  if (mousePressed) {
    for (int j = balls.length-1; j <= 3; j--) {
      float distance_ball = dist(mouseX, mouseY, balls[j].position_x, balls[j].position_y);
      if (distance_ball < (balls[j].size)/2) {
        sum -= balls[j].getArea();
        println("Sum of all area is : ", sum);
        lsball1 = (Ball[])subset(balls,0,j);
        lsball2 = (Ball[])subset(balls,j+1);
        lsball3 = (Ball[])subset(balls,j);
        balls = (Ball[])concat(lsball1,lsball3);
        break;
       }
    }
  }
}

void mouseClicked() {
  Ball[] lsball1;
  Ball[] lsball2;
  
  for (int i = balls.length-1; i>=0; i--) {
    float distance_ball = dist(mouseX, mouseY, balls[i].position_x, balls[i].position_y);
    if (distance_ball < (balls[i].size)/2) {
      sum -= balls[i].getArea();
      println("Sum of all area is : ", sum);
      lsball1 = (Ball[])subset(balls,0,i);
      lsball2 = (Ball[])subset(balls,i+1);
      balls = (Ball[])concat(lsball1,lsball2);
      break;
    }
  }
  /*
  for (int j = balls.length-1; j >= 0; j++) {
    float distance_ball = dist(mouseX, mouseY, balls[j].position_x, balls[j].position_y);
    if (distance_ball < (balls[j].size)/2) {
      sum -= balls[j].getArea();
      println("Sum of all area is : ", sum);
      lsball1 = (Ball[])subset(balls,0,j);
      lsball2 = (Ball[])subset(balls,j);
      balls =  (Ball[])concat(lsball1,lsball2);
      break;
    }
  }
  */
}
