/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ng_dataloader;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Ardmhor
 */
public class LoadToDatabase {

    public static void main(String[] args) {
        Albums loadA = new Albums();
        Singers loadS = new Singers();
        Users loadU = new Users();
        try {

            loadU.U_ReadData();
            loadS.S_ReadData();
            loadA.A_ReadData();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
