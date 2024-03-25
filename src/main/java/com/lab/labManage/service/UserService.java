package com.lab.labManage.service;

import com.lab.labManage.dto.UserDto;
import com.lab.labManage.dto.RoleNameDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;

    /**
     * update user role
     *
     * @param selectedUserId
     * @param selectedRoleId
     * @return
     */
    public boolean updateUserRoleFromAdminPanel(int selectedUserId, int selectedRoleId, String updateDescription) {

        Connection con = null;
        Statement stmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();

            int rowsAffected = stmt.executeUpdate("update user_roles " +
                    "SET role_id='" + selectedRoleId + "' where user_id='" + selectedUserId + "' ;");

            if (rowsAffected > 0) {
                int rowsAffected2 = stmt.executeUpdate("update users " +
                        "SET description='" + updateDescription + "' where id='" + selectedUserId + "' ;");

                if (rowsAffected2 > 0) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }


        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                con.close();
                stmt.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

    }

    /**
     * get all users information
     *
     * @return
     */
    public List<UserDto> getAllUserInfo() {

        Statement stmt = null;
        Statement stmt2 = null;
        Connection con = null;
        List<UserDto> users = new ArrayList<UserDto>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shcart", "root", "");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            stmt2 = con.createStatement();
            ResultSet rst = stmt.executeQuery("select * from users ;");

            while (rst.next()) {
                UserDto user = new UserDto();
                int userId = rst.getInt(1);
                user.setUserid(userId);
                user.setFirstName(rst.getString(2));
                user.setLastName(rst.getString(3));
                user.setMobile(rst.getString(4));
                user.setEmail(rst.getString(5));
                user.setUsername(rst.getString(7));
                user.setCreatedAt(rst.getDate(10));

                ResultSet rst2 = stmt2.executeQuery("select role_id from user_roles where user_id='" + userId + "' ;");

                if (rst2.next()) {
                    int roleId = rst2.getInt(1);
                    user.setRoleId(roleId);
                    user.setHasRole(true);
                } else {

                    user.setHasRole(false);
                }

                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return users;

    }

    /**
     * get user role,userid by username in the session
     *
     * @param username
     * @return
     */

    public List<RoleNameDto> getRoleFromUsername(String username) {

        Statement stmt = null;
        Connection con = null;
        List<RoleNameDto> Roleinfo = new ArrayList<RoleNameDto>();
//        int roleid = 0;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery("select role_id from user_roles where user_id = (select id from users where username = '" + username + "');");

            if (rst.next()) {

                RoleNameDto role = new RoleNameDto();
                role.setRoleId(rst.getInt(1));
                role.setUsername(username);
                Roleinfo.add(role);

            }


        } catch (Exception ex) {
            ex.printStackTrace();
        }


        return Roleinfo;

    }

    /**
     * Change password
     *
     * @param username
     * @return
     */
    public boolean changePassword(String username, String newPassword) {

        Connection con = null;
        Statement stmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();

            int rowsAffected = stmt.executeUpdate("update users " +
                    "SET password='" + newPassword + "' where username='" + username + "' ;");

            if (rowsAffected > 0) {
                return true;
            } else {
                return false;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                con.close();
                stmt.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }


}
