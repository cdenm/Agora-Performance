import oscP5.*;
import netP5.*;
 
OscP5 oscP5;
NetAddress myRemoteLocation;
boolean drawFlag=false;


static final int NUM_LINES = 50;
float t;
float input1 = 200;
float [] input2 = new float [3];
float [] input3 = new float [3];

void setup() {
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
  size(1920, 1080);
  input2[0] = 0;
  input2[1] = 0;
  input2[2] = 0;
  input3[0] = 0;
  input3[1] = 0;
  input3[2] = 0;
  
  rectMode(CENTER);
}

void draw() {
  background(input3[0],input3[1],input3[2]);
  noStroke();
  fill(input2[2],input2[1],input2[0], 150);
  //OUTERLINES
  push();
  translate(832, 300);
  rotate(radians(78.4));
  rect(0, 0, 17+input1, 272+input1);
  pop();
  push();
  translate(634, 475);
  rotate(radians(11.5));
  rect(0, 0, 17+input1, 222+input1);
  pop();
  push();
  translate(731, 582);
  rotate(radians(75.7));
  rect(0, 0, 17+input1, 199+input1);
  pop();
  push();
  translate(996, 699);
  rotate(radians(137.6));
  rect(0, 0, 17+input1, 338+input1);
  pop();
  push();
  translate(1206, 698);
  rotate(radians(207.4));
  rect(0, 0, 17+input1, 274+input1);
  pop();
  push();
  translate(1141, 407);
  rotate(radians(135));
  rect(0, 0, 17+input1, 339+input1);
  pop();
  
  //INNERLINES
  push();
  translate(762, 444);
  rotate(radians(136.9));
  rect(0, 0, 17+input1, 219+input1);
  pop();
  push();
  translate(851, 391);
  rotate(radians(106.1));
  rect(0, 0, 17+input1, 314+input1);
  pop();
  push();
  translate(923, 405);
  rotate(radians(207.4));
  rect(0, 0, 17+input1, 252+input1);
  pop();
  push();
  translate(1015, 358);
  rotate(radians(350.9));
  rect(0, 0, 17+input1, 122+input1);
  pop();
  push();
  translate(944, 496);
  rotate(radians(60));
  rect(0, 0, 17+input1, 137+input1);
  pop();  
  push();
  translate(1158, 496);
  rotate(radians(112.3));
  rect(0, 0, 17+input1, 208+input1);
  pop();
  push();
  translate(1071, 549);
  rotate(radians(90));
  rect(0, 0, 17+input1, 361+input1);
  pop();
  push();
  translate(1081, 648);
  rotate(radians(165.7));
  rect(0, 0, 17+input1, 346+input1);
  pop();
  
  //CIRCLES
  fill(input2[0],input2[1],input2[2], 200);
  circle(669, 336, 46+input1);
  circle(997, 266, 46+input1);
  circle(1285, 548, 46+input1);
  circle(1129, 849, 46+input1);
  circle(859, 548, 46+input1);
  circle(606, 615, 46+input1);
  circle(859, 548, 46+input1);
  circle(1031, 449, 46+input1);


  input1 = input1-0.5;
  input2[0] = input2[0] + 0.5;
  input2[1] = input2[1] + 0.5;
  input2[2] = input2[2] + 0.5;
  input3[0] = input3[0] - 1;
  input3[1] = input3[1] - 1;
  input3[2] = input3[2] - 1;

}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage msg) {
  System.out.println("### got a message " + msg);
  System.out.println( msg);
  System.out.println( msg.typetag().length());


  if (msg.checkAddrPattern("/viz/input1")==true) {
    input1 =msg.get(0).intValue();
    System.out.print("input1 "+ input1 + "\n");
  }
  
  if (msg.checkAddrPattern("/viz/input2")==true) {
    for (int i =0; i<msg.typetag().length(); i++) {
      input2[i] = msg.get(i).intValue();
      System.out.print("input2 " + i + ": " + msg.get(i).intValue() + "\n");
    }
  }
  
    if (msg.checkAddrPattern("/viz/input3")==true) {
    for (int i =0; i<msg.typetag().length(); i++) {
      input3[i] = msg.get(i).intValue();
      System.out.print("input3 " + i + ": " + msg.get(i).intValue() + "\n");
    }
  }


 
}
