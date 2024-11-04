//Frankie Chia | Sept 30 | Calculator
Button[] buttons = new Button[23];
String dVal = "0";
float l, r, result;
char op;
boolean left;


void setup() {
  size(210, 250);
  background(50);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  buttons[0] = new Button(25, 225, '0', true);
  buttons[1] = new Button(25, 185, '1', true);
  buttons[2] = new Button(65, 185, '2', true);
  buttons[3] = new Button(105, 185, '3', true);
  buttons[4] = new Button(25, 145, '4', true);
  buttons[5] = new Button(65, 145, '5', true);
  buttons[6] = new Button(105, 145, '6', true);
  buttons[7] = new Button(25, 105, '7', true);
  buttons[8] = new Button(65, 105, '8', true);
  buttons[9] = new Button(105, 105, '9', true);
  buttons[10] = new Button(25, 65, 'c', false);
  buttons[11] = new Button(65, 65, '%', false);
  buttons[12] = new Button(105, 65, '±', false);
  buttons[13] = new Button(145, 65, 'x', false);
  buttons[14] = new Button(145, 105, '÷', false);
  buttons[15] = new Button(145, 145, '+', false);
  buttons[16] = new Button(145, 185, '-', false);
  buttons[17] = new Button(185, 65, 'π', false);
  buttons[18] = new Button(185, 105, 'e', false);
  buttons[19] = new Button(185, 145, '√', false);
  buttons[20] = new Button(65, 225, '.', false);
  buttons[21] = new Button(145, 225, '=', false);
  buttons[22] = new Button(185, 185, '^', false);
}

void draw() {
  background(255, 255, 255);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }

  updateDisplay();
  //println("Left:" + l + " Right:" + r + " Result:" + result + "Op:" + op + " L:" + left);
}

void  updateDisplay() {
  fill(0, 255, 255);
  rectMode(CENTER);
  rect(width/2, 25, 190, 25);
  fill(0);
  if (dVal.length()<12) {
    textSize(25);
  } else if (dVal.length() == 12) {
    textSize(24);
  } else if (dVal.length() == 13) {
    textSize(23);
  } else if (dVal.length() == 14) {
    textSize(22);
    } else if (dVal.length() == 15) {
    textSize(21);
    } else if (dVal.length() == 16) {
    textSize(20);
  }
  
  textAlign(RIGHT);
  text(dVal, width-20, 30);
}

void mouseReleased() {
  //println("Left:" + l + " Right:" + r + " Result:" + result + "Op:" + op + " L:" + left);
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length()<20) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && buttons[i].val == ('.')) {
      handleEvent(".", false);
    } else if (buttons[i].on && buttons[i].val == ('c')) {
      handleEvent("c", false);
    } else if (buttons[i].on && buttons[i].val == ('+')) {
      handleEvent("+", false);
    } else if (buttons[i].on && buttons[i].val == ('-')) {
      handleEvent("-", false);
    } else if (buttons[i].on && buttons[i].val == ('x')) {
      handleEvent("*", false);
    } else if (buttons[i].on && buttons[i].val == ('÷')) {
      handleEvent("/", false);
    } else if (buttons[i].on && buttons[i].val == ('=')) {
      handleEvent("=", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('±')) {
      if (left == true) {
        l *= -1;
        dVal = str(l);
      } else if (left == false) {
        r *= -1;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('√')) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else if (left) {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('π')) {
      if (left) {
        l = PI;
        dVal = str(l);
      } else if (left) {
        r = PI;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('e')) {
      if (left) {
        l = exp(1.0);
        dVal = str(l);
      } else if (left) {
        r = exp(1.0);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('^')) {
      if (left) {
        l = pow(l, 2);
        dVal = str(l);
      } else if (left) {
        r = pow(r, 2);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('%')) {
      if (left) {
        l = l / 100;
        dVal = str(l);
      } else if (left) {
        r = r / 100;
        dVal = str(r);
      }
    }
  }
}

//    if (buttons[i].on == true && dVal.equals("0.0")) {
//      dVal = buttons[i].val;
//    } else if (buttons[i].on && buttons[i].val.equals("C")) {
//     dVal = "0.0";
//      l = 0.0;
//      r = 0.0;
//      result = 0.0;
//      op = ' ';
//    } else if (buttons[i].on) {
//     dVal += buttons[i].val;
//    }



void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  } else if (op == 'e') {
    result = pow(l, r);
  }
  dVal = nf(result);
}

void keyPressed () {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (key == BACKSPACE) {
    handleEvent("c", false);
  } else {
    if (key == 0 || keyCode == 96 || keyCode == 48) {
      handleEvent("0", true);
    } else if (key == 1 || keyCode == 49 || keyCode == 97) {
      handleEvent("1", true);
    } else if (key == 2 || keyCode == 98 || keyCode == 50) {
      handleEvent("2", true);
    } else if (key == 3 || keyCode == 51|| keyCode == 99) {
      handleEvent("3", true);
    } else if (key == 4 || keyCode == 100 || keyCode == 52) {
      handleEvent("4", true);
    } else if (key == 5 || keyCode == 53 || keyCode == 101) {
      handleEvent("5", true);
    } else if (key == 6 || keyCode == 102 || keyCode == 54) {
      handleEvent("6", true);
    } else if (key == 7 || keyCode == 55 || keyCode == 103) {
      handleEvent("7", true);
    } else if (key == 8 || keyCode == 104 || keyCode == 56) {
      handleEvent("8", true);
    } else if (key == 9 || keyCode == 57 || keyCode == 105) {
      handleEvent("9", true);
    } else if (key == '+' || keyCode == 61) {
      handleEvent("+", false);
    } else if (key == '-' || keyCode == 45) {
      handleEvent("-", false);
    } else if (key == '/' || keyCode == 47) {
      handleEvent("/", false);
    } else if (key == 'x' || keyCode == 56) {
      handleEvent("*", false);
    } else if (key == '.' || keyCode == 46) {
      handleEvent(".", false);
    } else if (keyCode == 10) {
      handleEvent("=", false);
    } else if (key == 'c' || keyCode == 67 || keyCode == 8) {
      handleEvent("c", false);
    }
  }
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length() < 16 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length() < 16 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    op = '+';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("-") && !isNum) {
    op = '-';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("/") && !isNum) {
    op = '/';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("*") && !isNum) {
    op = '*';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("=") && !isNum) {
    performCalc();
  } else if (keyVal.equals("c") && !isNum) {
    dVal = "0";
    l = 0.0;
    r = 0.0;
    result = 0.0;
    op = 'c';
    left = true;
  } else if (keyVal.equals(".") && !isNum) {
    if(!dVal.contains(".")) {
    dVal += keyVal; }
    
      }
    
    
  }
