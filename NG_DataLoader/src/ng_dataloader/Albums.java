/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ng_dataloader;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.Scanner;

/**
 *
 * @author Ardmhor
 */
public class Albums {

    String[] A_parts;
    String A_scanString;

    public void A_ReadData() throws FileNotFoundException, IOException, ClassNotFoundException, SQLException {

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ng_music?useTimezone=true&serverTimezone=UTC", "NG_User", "NG_Password");
        Statement st = con.createStatement();

        File ng_albums = new File("C:\\Users\\Ardmhor\\Desktop\\NextGate\\NextGate-EMEA-TakeHomeProgrammingAssignment-L1_1-20190603\\resource\\ng_albums.txt");
        Scanner A_ngScan = new Scanner(ng_albums);
        int A_Id = 1;
        int sid = 10;

        A_ngScan.nextLine();
        while (A_ngScan.hasNextLine()) {

            A_scanString = A_ngScan.nextLine();
            A_parts = A_scanString.split(" ");
            st.executeUpdate("insert into ng_albums(ng_albums_id,ng_singers_id,album_name,release_year, record_company) values "
                    + "('" + A_Id + "','" + sid + "','" + A_parts[1] + "','" + A_parts[2] + "','" + A_parts[3] + "' )");
            A_Id++;
            sid++;
        }
    }
}
