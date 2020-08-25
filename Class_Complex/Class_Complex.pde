float sum,x;
float i = sqrt(-1);

class Complex {
  float a,b,c,d;
  
  Complex(float value1, float value2) {
    a = value1;
    b = value2;
  }
  
  float calPlus() {
    x = a + b;
    return x;
  }
  
  float calMinus() {
    x = a - b;
    return x;
  }
  
  float calMultiply() {
    x = a * b;
    return x;
  }
  
  float calDivine() {
    x = a / b;
    return x;
  }
}

Complex complex;

void setup() {
  complex = new Complex(5+2*i,3+i);
}

void draw() {
  sum = complex.calPlus();
  println(sum);
}
