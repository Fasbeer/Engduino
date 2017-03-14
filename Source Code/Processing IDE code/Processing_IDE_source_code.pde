import processing.serial.*;

Serial myPort; // The serial port
int xPos = 10; // horizontal position of the graph
float maxTemp = 0; //innitiate and assign max temp
float minTemp = 500; // innitiate and assign min temp
float temp; //innitiate temp

void setup () {
     // set the window size:
     size(1000, 800);

     // List all the available serial ports
     println(Serial.list());
     myPort = new Serial(this, Serial.list()[0], 9600);

     background(0);//set background black
     }

	 
void draw () {
              if ( myPort.available() > 0) // confirms if data is available 
                           {   
                             fill(0); // fills top with colour black
                             rect(0, 0, 2000, 50); 
               String inString = myPort.readStringUntil('\n'); // data read from serial port stored
                             if (inString != null) {   //confirms data recieved correctly
                                   temp = Float.parseFloat(inString); //string converted to float
                                   println(temp); //prints temperature on the console
 
                                   if (temp > maxTemp){ 
                                         maxTemp = temp; //sets max temperature
                                             }

                                   if (temp < minTemp){
                                         minTemp = temp; //sets min temperature
                                             }
                                  float inByte = float(inString) * 20; // covert value of inString into int
                                  inByte = map(inByte, 0, 1023, 0, height); // map the height of the screen
     
     
                                  stroke(200, 200, 200);
                                  line(xPos, height-10, xPos, height - inByte);//draw graph line
                                  textSize(35);
                                  fill(255, 255, 255); //set text colour
                                  text("Temp="+inString, 10, 40); //print current temperature
                                  textSize(30);
                                  fill(255, 0, 0);
                                  text("Max: " + maxTemp, 250, 40); //print max temperature
                                  fill(0, 255, 0);
                                  text("Min: " + minTemp, 430, 40);//print min temperature

                                  // at the edge of the screen, go back to the beginning:
                                  if (xPos >= width) {
                                        xPos = 10;}
                                                 
                                  else {
                                  // increment the x axis :
                                  xPos++;}
                                        
                                                     }
                           }
   
             }