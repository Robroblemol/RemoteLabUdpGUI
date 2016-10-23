import g4p_controls.*;//importamos libreria
import static javax.swing.JOptionPane.*;//mensajes emergentes
void intGUI(){
  BApagar = new GButton(this,10,45,100,35,"Descargar Condensado");
  BApagar.fireAllEvents(true);//Habilitamos toda las clases
                            // de eventos de los botones
  BEncender = new GButton(this,120,45,100,35,"Cargar Condensado");
  BEncender.fireAllEvents(true);
  BDetener = new GButton(this, 230,45,100,35,"Detener");
  BDetener.fireAllEvents(true);

  plot = new GPlot(this);// creamos la grafica
  plot.setPos(5, 85);//ajustamos la posicion
  plot.setDim(350, 225);//dimencion de la ventana
  plot.getTitle().setText("V(t) vs t");//titulo de grafico
  plot.getXAxis().getAxisLabel().setText("t(s)");//titulo eje X
  plot.getYAxis().getAxisLabel().setText("V(t)");//titulo eje Y
  plot.activatePointLabels();

}

void handleButtonEvents(GButton Botton,GEvent event){
  if(Botton==BApagar&&event==GEvent.PRESSED){
   println("Boton Presionado: Decarga ");//si lo presionamos
   state = "Carga=0";
   flagD=false;
}
  if(Botton==BEncender&&event==GEvent.PRESSED){
    println("Boton Presionado: Carga ");//si lo presionamos
    state = "Carga=1";
    flagD=false;
  }
  String save = "new";
  if(Botton==BDetener&&event==GEvent.PRESSED){
    println("Boton Presionado: Stop ");//si lo presionamos
   if(flagD==false){
       flagD=true;
       save = showInputDialog("Digite nombre para guardar datoss");
       saveTable(tabla,"data/"+save+".csv");
   }
     else
       flagD=false;
  }
}
