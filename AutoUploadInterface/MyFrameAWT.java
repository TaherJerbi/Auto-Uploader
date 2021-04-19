import java.awt.*;
public class MyFrameAWT extends Frame{
    Panel pNorth = new Panel();
    Button bSetPath = new Button("Set Path");
    Label lPath = new Label("...");

    Panel pSouth = new Panel();
    TextField tf = new TextField("",40);
    Button bAdd = new Button("Add");

    public MyFrameAWT(){
        pNorth.setBackground(Color.GRAY);
        pNorth.add(bSetPath);
        pNorth.add(lPath);

        pSouth.setBackground(Color.LIGHT_GRAY);
        pSouth.add(tf);
        pSouth.add(bAdd);

        this.add(pNorth);
        this.add(pSouth);
        this.setLayout(new GridLayout(2,1));
        this.setBounds(10,10,450,200);
        this.setVisible(true);

    }
}
