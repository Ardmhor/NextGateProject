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

/**
 *
 * @author Ardmhor
 */
public class Users {

    String U_parts[];
    String U_scanString;

    public void U_ReadData() throws FileNotFoundException, IOException, ClassNotFoundException, SQLException {

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ng_music?useTimezone=true&serverTimezone=UTC", "NG_User", "NG_Password");
        Statement st = con.createStatement();

        File ng_users = new File("C:\\Users\\Ardmhor\\Desktop\\NextGate\\NextGate-EMEA-TakeHomeProgrammingAssignment-L1_1-20190603\\resource\\ng_users.txt");
        Scanner U_ngScan = new Scanner(ng_users);
        int U_Id = 100;

        U_ngScan.nextLine();
        while (U_ngScan.hasNextLine()) {

            U_scanString = U_ngScan.nextLine();
            U_parts = U_scanString.split(" ");
            st.executeUpdate("insert into ng_users(ng_users_id,username,password) values "
                    + "('" + U_Id + "','" + U_parts[0] + "','" + U_parts[1] + "' )");
            U_Id++;
        }

    }

}
