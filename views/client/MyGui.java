import javax.swing.*;
import java.awt.*;

public class MyGUI extends JFrame implements ActionListener  {  
    public MyGUI() {    
        JButton okButton = new JButton("OK");    
        getContentPane().add(okButton);  
    }
    public void actionPerformed(ActionEvent e) {   
        System.out.println("The OK button is clicked");  
    }
 
    public static void main(String[] args) {    
        JFrame frame = new MyGUI();    
        frame.setSize(300, 300);    
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);   
        frame.setVisible(true);  
    }
}