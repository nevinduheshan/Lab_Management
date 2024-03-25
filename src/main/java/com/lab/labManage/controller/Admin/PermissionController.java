package com.lab.labManage.controller.Admin;

import com.lab.labManage.dto.RoleDto;
import com.lab.labManage.service.AdminService;
import com.lab.labManage.dto.PermissionDto;
import com.lab.labManage.dto.RolePermissionDto;
import com.lab.labManage.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PermissionController {

    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private AdminService adminService;

    /**
     *  This method used to get Permission
     * @param model
     * @param request
     * @param selectedRolename
     * @param selectedRoleId
     * @return
     */
    @RequestMapping(value = "loadPermissionsForSelectedRole", method = RequestMethod.POST)
    public String getPermissions(Model model, HttpServletRequest request, @RequestParam("selectedRolename") String selectedRolename,@RequestParam("selectedRoleId") String selectedRoleId ) {
      //  List<RoleDto> roles = adminService.getRoles();
        request.setAttribute("selectedRole", selectedRolename);
        request.setAttribute("selectedRoleId", selectedRoleId);

        List<RolePermissionDto>  permissionsForSelRole = permissionService.getPermissionsByRoles(selectedRoleId);
        request.setAttribute("permissionsForSelectRole", permissionsForSelRole);

        List<RoleDto> roles = adminService.getRoles();
        request.setAttribute("role", roles);

        List<PermissionDto> permissions = adminService.getPermissionsInDB();
        request.setAttribute("Permissions",permissions);

        return "admin/addPermissions";
    }


    /**
     * this method use to save Permission
     * @param model
     * @param request
     * @param selectedRolename
     * @param selectedRoleId
     * @param selectedPermissionId     *
     * @return
     */
    @RequestMapping(value = "savePermissionsForSelectedRole", method = RequestMethod.POST)
    public String savePermissionsForRole(Model model, HttpServletRequest request, @RequestParam("AddPermissionPopupSelectedRole") String selectedRolename,@RequestParam("AddPermissionPopupSelectedRoleId") String selectedRoleId,@RequestParam("selectedPermissionKey") String selectedPermissionId) {
      //early Front UI has the description ,later came the User requirement to remove it.So remove this attribute.
        if( selectedRoleId != null && !permissionService.isPermissionAlreadyAdded(selectedRoleId, selectedPermissionId)) {
            String Description = "";
            boolean returnval = permissionService.savePermissionForSelectedRoles(selectedRoleId, Description, selectedPermissionId);
        }else {
            // Permission is already added, set an attribute with the error message
            request.setAttribute("errormessage", "Permission is Already Added.");
        }

        request.setAttribute("selectedRole", selectedRolename);
        request.setAttribute("selectedRoleId", selectedRoleId );

        List<RolePermissionDto>  permissionsForSelRole = permissionService.getPermissionsByRoles( selectedRoleId  ) ;
        request.setAttribute("permissionsForSelectRole", permissionsForSelRole);

        List<RoleDto> roles = adminService.getRoles();
        request.setAttribute("role", roles);

        List<PermissionDto> permissions = adminService.getPermissionsInDB();
        request.setAttribute("Permissions",permissions);

        return "admin/addPermissions";
    }


    /**
     *
     * @param model
     * @param request
     * @param selectedRolename
     * @param selectedRoleId
     * @param selectedPermissionId
     * @return
     */
    @RequestMapping(value = "deletePermissionsForSelectedRole", method = RequestMethod.POST)
    public String deletePermissionsForRole(Model model, HttpServletRequest request, @RequestParam("AddPermissionPopupSelectedRole") String selectedRolename,@RequestParam("AddPermissionPopupSelectedRoleId") String selectedRoleId,@RequestParam("selectedPermissionId") String selectedPermissionId,@RequestParam("rolePermissionId") String rolePermissionId) {

        if(rolePermissionId.contains("'")){
            rolePermissionId = rolePermissionId.replaceAll("'","");
        }

        if(selectedRolename.contains("'")){
            selectedRolename = selectedRolename.replaceAll("'","");
        }

        if(selectedRoleId.contains("'")){
            selectedRoleId = selectedRoleId.replaceAll("'","");
        }

        if( rolePermissionId != null) {
            boolean returnval = permissionService.deletePermissionForRolePermission(rolePermissionId);
        }

        request.setAttribute("message", "succesfully deleted the permission");

        request.setAttribute("selectedRole", selectedRolename);
        request.setAttribute("selectedRoleId", selectedRoleId );

        List<RolePermissionDto>  permissionsForSelRole = permissionService.getPermissionsByRoles( selectedRoleId  ) ;
        request.setAttribute("permissionsForSelectRole", permissionsForSelRole);

        List<RoleDto> roles = adminService.getRoles();
        request.setAttribute("role", roles);

        List<PermissionDto> permissions = adminService.getPermissionsInDB();
        request.setAttribute("Permissions",permissions);

        return "admin/addPermissions";
    }



}
