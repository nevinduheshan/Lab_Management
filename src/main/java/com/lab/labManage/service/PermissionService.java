package com.lab.labManage.service;


import com.lab.labManage.dto.RolePermissionDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class PermissionService {

    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;

    /**
     * get Permissions By Role Id
     *
     * @param selectRoleId
     * @return
     */
    public List<RolePermissionDto> getPermissionsByRoles(String selectRoleId) {

        Statement stmt = null;
        Statement stmt2 = null;
        Connection con = null;
        List<RolePermissionDto> permissions = new ArrayList<RolePermissionDto>();
        String selectedUsername = null;
        ResultSet rst = null;
        ResultSet rst2 = null;
        int selectedUserId = 0;
        try {


            Class.forName("com.mysql.jdbc.Driver");
            //       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shcart", "root", "");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            stmt2 = con.createStatement();


            rst = stmt.executeQuery("select * from role_permissions where role_id='" + selectRoleId + "' ;");

            while (rst.next()) {


                RolePermissionDto rolePermissionDto = new RolePermissionDto();
                rolePermissionDto.setId(rst.getInt(1));
                rolePermissionDto.setDescription(rst.getString(2));

                rolePermissionDto.setRoleId(rst.getInt(4));
                int permissionId = rst.getInt(3);
                rolePermissionDto.setPermissionId(permissionId);
                rst2 = stmt2.executeQuery("select id,name,keyvalue from permissions where id='" + permissionId + "' ;");

                if (rst2.next()) {
                    String permissionName = rst2.getString(2);
                    rolePermissionDto.setPermissionName(permissionName);
                    String keyval = rst2.getString(3);
                    rolePermissionDto.setKeyvalue(keyval);
                }


                permissions.add(rolePermissionDto);
            }


        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            try {
                con.close();
                rst.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return permissions;


    }

    /**
     * save Permission For selected Roles
     *
     * @param selectRoleId
     * @return
     */
    public boolean savePermissionForSelectedRoles(String selectRoleId, String description, String permissionId) {

        Statement stmt = null;
        Statement stmt2 = null;
        Connection con = null;
        List<RolePermissionDto> permissions = new ArrayList<RolePermissionDto>();
        String selectedUsername = null;
        int selectedUserId = 0;
        try {
            ResultSet rst = null;
            ResultSet rst2 = null;
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();


            PreparedStatement pst = con.prepareStatement("insert into role_permissions(description,permission_id,role_id,created_at,updated_at ) values(?,?,?,?,?);");

            pst.setString(1, description);
            pst.setInt(2, (new Integer(permissionId)).intValue());
            pst.setInt(3, (new Integer(selectRoleId)).intValue());

            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            pst.setTimestamp(4, timestamp);
            pst.setTimestamp(5, timestamp);

            int executeU = pst.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }

        return true;

    }


    /**
     * delete Permission by role Permission Id
     * @param rolePermissionId
     * @return
     */
    public boolean deletePermissionForRolePermission(String rolePermissionId) {

        Statement stmt = null;
        Statement stmt2 = null;
        Connection con = null;
        List<RolePermissionDto> permissions = new ArrayList<RolePermissionDto>();
        String selectedUsername = null;
        int selectedUserId = 0;
        try {
            ResultSet rst = null;
            ResultSet rst2 = null;
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();


            PreparedStatement pst = con.prepareStatement("delete from role_permissions where id = ?;");

          //  pst.setString(1, description);
            pst.setInt(1, (new Integer(rolePermissionId)).intValue());
          //  pst.setInt(3, (new Integer(selectRoleId)).intValue());

         //   Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        //    pst.setTimestamp(4, timestamp);
        //    pst.setTimestamp(5, timestamp);

            int executeU = pst.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }

        return true;

    }

    /**
     *
     * @param selectedRoleId
     * @param selectedPermissionId
     * @return
     */
    public boolean isPermissionAlreadyAdded(String selectedRoleId, String selectedPermissionId) {
        Statement stmt = null;
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            ResultSet resultSet = stmt.executeQuery("SELECT COUNT(*) FROM role_permissions WHERE role_id='" + selectedRoleId + "' AND permission_id='" + selectedPermissionId + "'");
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;    }
}





