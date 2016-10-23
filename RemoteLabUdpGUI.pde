import g4p_controls.*;//importamos libreria
import grafica.*;//libreria grafica
import hypermedia.net.*;

UDP udp; // Udp Object
GButton BApagar, BEncender, BDetener;//buttons Object
GPlot plot; // grafica Object
GPointsArray points = new GPointsArray();
Table tabla;// declaro un objeto tipo tabla
TableRow newRow;
String ip   ="192.168.0.189";
String state = "";
int puerto  =8888;
float v=0;
boolean   flagD= false;

void setup(){
  size(460,415);
  tabla = new Table();// constructor of tabla Object
  tabla.addColumn("Time");
  tabla.addColumn("Volts");//Add columns
  newRow = tabla.addRow();// add Row
  udp = new UDP( this, 8888 );  // create a new datagram connection on port 6000
  udp.listen(true);             //wait for mensages
  intGUI();                     //start GUi
}

void draw(){
 background(216,210,212);
  plot.setPoints(points);
 plot.beginDraw();// iniciamos dibujo de grafica
    plot.drawBackground();// pintamos el fondo por defecto (blanco)
    plot.drawBox();//dibujamos la caja que nontiene la grafica
    plot.drawXAxis();// eje X
    plot.drawYAxis();// eje y
    plot.drawTitle();// titulo de grafico
    plot.drawGridLines(GPlot.BOTH);// grilla
    plot.drawLines();// uso de lineas
    plot.drawPoints();// uso de puntos
    plot.drawLabels();// pintamos la etiquetas
  plot.endDraw();// finaliza el dibujo de la grafica

color c = color (0);// variable de color para el texto
  fill (c);// lo que escibamos a partir de aqui tendrá colo negro
  textSize(20);
  text("Laboratorio Carga y Descarga Condensador",34,28);
  delay(1000);
  if(flagD==false)
    udp.send(state,ip,puerto);

}
int t=1;
void receive( byte[] data ) {          // <-- default handler
//void receive( byte[] data, String ip, int port ) {   // <-- extended handler
String str="";
 for(int i=0; i < data.length; i++){
 print(char(data[i]));
 str=str+char(data[i]);
 }
 println();
 v=float(str);
 println("v :"+v);
 if(flagD==false){
   points.add(t,v,"t: "+t+" V: "+v);
   TableRow newRow = tabla.addRow();// add Row
   newRow.setFloat("Volts",v);
   newRow.setInt("Time",t);
  }
 t++;
 }
