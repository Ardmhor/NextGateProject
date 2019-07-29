/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ng_dataloader;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Singers {

    String S_parts[];
    String S_scanString;

    public void S_ReadData() throws FileNotFoundException, IOException, ClassNotFoundException, SQLException {

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ng_music?useTimezone=true&serverTimezone=UTC", "NG_User", "NG_Password");
        Statement st = con.createStatement();

        File ng_singers = new File("C:\\Users\\Ardmhor\\Desktop\\NextGate\\NextGate-EMEA-TakeHomeProgrammingAssignment-L1_1-20190603\\resource\\ng_singers.txt");
        Scanner S_ngScan = new Scanner(ng_singers);
        int S_Id = 10;

        S_ngScan.nextLine();
        while (S_ngScan.hasNextLine()) {

            S_scanString = S_ngScan.nextLine();
            S_parts = S_scanString.split(" ");
            st.executeUpdate("insert into ng_singers(ng_singers_id,name,dob,sex) values "
                    + "('" + S_Id + "','" + S_parts[0] + "','" + S_parts[1] + "','" + S_parts[2] + "' )");
            S_Id++;
        }

    }
}
