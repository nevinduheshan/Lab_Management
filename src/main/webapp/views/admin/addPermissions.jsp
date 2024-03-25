<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lab.labManage.dto.UserDto" %>
<%@ page import="com.lab.labManage.dto.RoleDto" %>
<%@ page import="com.lab.labManage.dto.PermissionDto" %>
<%@ page import="com.lab.labManage.dto.RolePermissionDto" %>
<html>

<head>
    <head>
        <title>Add Permission</title>
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
        <link rel="stylesheet" href="https://flowbite.com/docs/flowbite.css?v=1.6.5a"/>

        <script type="text/javascript">
            function loadAddPermissionPopup() {
                var sRole = document.getElementById("selectedRole");
                var sRoleId = document.getElementById("selectedRoleIds");


                var addPermissionPopUpSelRole = document.getElementById("AddPermissionPopupSelectedRole");
                var addPermissionPopUpSelRoleId = document.getElementById("AddPermissionPopupSelectedRoleId");

                addPermissionPopUpSelRole.value = sRole.value;
                addPermissionPopUpSelRoleId.value = sRoleId.value;
            }


            function copyselectedPermission() {
                var sSelectedPermissionKey = document.getElementById("selectedPermissionKey");
                var dropdownSelectPermission = document.getElementById("dropdownSelectPermission");


                var text = dropdownSelectPermission.options[dropdownSelectPermission.selectedIndex].text;
                var val = dropdownSelectPermission.options[dropdownSelectPermission.selectedIndex].value;

                sSelectedPermissionKey.value = val;

            }


            function addPermission() {
                document.getElementById("frmAddPermission").submit();
            }


            function deletePermissionfromRole(num){

                var AddPermissionPSelectedRole = document.getElementById("AddPermissionPopupSelectedRole");
                var selectedRole = document.getElementById("selectedRole");

                AddPermissionPSelectedRole.value = selectedRole.value;

                var AddPermissionPSelectedRoleId = document.getElementById("AddPermissionPopupSelectedRoleId");
                var selectedRoleIds = document.getElementById("selectedRoleIds");

                AddPermissionPSelectedRoleId.value = selectedRoleIds.value;

                document.getElementById("frmdeletePermission").action = "<%=request.getContextPath()%>/deletePermissionsForSelectedRole?rolePermissionId='"+num+"'&AddPermissionPopupSelectedRole='"+AddPermissionPopupSelectedRole.value+"'&AddPermissionPopupSelectedRoleId='"+AddPermissionPSelectedRoleId.value+"'";
                document.getElementById("frmdeletePermission").submit();
                //  return true;
            }



        </script>
    </head>
</head>

<body>
<%@include file="adminPanel.jsp" %>
<div class="content ml-12 transform ease-in-out duration-500 pt-20 px-2 md:px-5 pb-4 ">
    <nav class="flex px-5 py-3 text-gray-700  rounded-lg bg-gray-50 dark:bg-[#1E293B] " aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-3">
            <li class="inline-flex items-center">
                <a href="adminControl"
                   class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white">
                    <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path>
                    </svg>
                    Home
                </a>
            </li>
            <li>
                <div class="flex items-center">
                    <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fillRule="evenodd"
                              d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                              clipRule="evenodd"></path>
                    </svg>
                    <a href="#"
                       class="ml-1 text-sm font-medium text-gray-700 hover:text-gray-900 md:ml-2 dark:text-gray-400 dark:hover:text-white">Add
                        Pemission</a>
                </div>
            </li>
        </ol>
    </nav>
</div>

<div class="md:px-72 sm:pr-10 sm:pl-16 pr-10 pl-16 ">

    <div class=" overflow-x-auto shadow-md sm:rounded-lg  mb-10 mt-10 bg-gray-700">
        <% String selRoleName = (String) request.getAttribute("selectedRole");
            String selRoleNameId = (String) request.getAttribute("selectedRoleId");

        %>
        <form id="frmLoadPermissionByRoleId" name="frmLoadPermissionByRoleId" method="post"
              action="<%=request.getContextPath()%>/loadPermissionsForSelectedRole">

            <div class="flex items-center justify-center mt-4">
            <label for="dropdownSelectRole" class="dark:text-white text-black px-4" > Select Role:</label>
            <select name="dropdownSelectRole" id="dropdownSelectRole"
                    onchange="javascript:loadPermissionForSelectedRole()" class="text-white bg-blue-700 hover:bg-blue-800  font-medium rounded-lg text-sm  text-center inline-flex items-center dark:bg-gray-900 dark:hover:bg-gray-700"  >
                <option value="" selected disabled>Select</option>
                <%



                    if (request.getAttribute("role") != null)  // Null check for the object
                    {


                        List<RoleDto> roles = (List<RoleDto>) request.getAttribute("role");

                        for (int i = 1; i < roles.size(); i++) {
                            RoleDto role = roles.get(i);

                            if (selRoleName != null && (selRoleName.trim().equals(role.getName()))) {


                %>


                <option value="<%=role.getId() %>" selected>
                    <%=role.getName() %>
                </option>

                <%} else { %>

                <option value="<%=role.getId() %>">
                    <%
                        String roleName = role.getName();
                        if (roleName.equals("patient")) {
                            out.print("Gym Member");
                        }
                        else {
                        String capitalizedRoleName = Character.toUpperCase(roleName.charAt(0)) + roleName.substring(1);
                        out.print(capitalizedRoleName);
                        }
                    %>
                </option>

                <%
                            } }

                             %>

                         <%

                    }
                %>
            </select>
            </div>

            <input type="hidden" id="selectedRoleId" name="selectedRoleId" value=""/>
            <input type="hidden" id="selectedRolename" name="selectedRolename" value=""/>
        </form>
    </div>
</div>

<div class="relative">
    <div class="absolute inset-0 flex items-center" aria-hidden="true">
        <div class="w-full border-t border-gray-500"></div>
    </div>
    <div class="relative flex justify-center">
        <span class="px-2 bg-white dark:bg-gray-900 text-sm dark:text-white text-gray-900"> Permissions </span>
    </div>
</div>


<!-- This example requires Tailwind CSS v2.0+ -->
<div class="md:px-72 sm:pr-10 sm:pl-16 pr-10 pl-16">

    <div class="mt-10 mb-10">
        <dl class="sm:divide-y sm:divide-gray-200">
            <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4">
                <dt class="text-sm font-medium dark:text-white text-gray-500">Role name</dt>
                <dd class="mt-1 text-sm dark:text-white text-gray-900 sm:mt-0 sm:col-span-2"><% if(selRoleName != null ){ out.print(selRoleName); }%></dd>
                <input type="hidden" id="selectedRole" name="selectedRole" value="<%=selRoleName%>"/>
                <input type="hidden" id="selectedRoleIds" name="selectedRoleIds" value="<%=selRoleNameId%>"/>
            </div>
            <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4">
                <dt class="text-sm font-medium dark:text-white text-gray-500">Current Prmissions</dt>
                <dd class="mt-1 text-sm  text-gray-900 sm:mt-0 sm:col-span-2">
                    <% String successdeletepermission = (String)request.getAttribute("message"); %>
                    <% String alreadyaddedpermission = (String)request.getAttribute("errormessage"); %>
                    <div id="deletePermission"  style="color:green;" > <% if(successdeletepermission != null){ out.println(successdeletepermission); }%></div>
                    <div id="deletePermission"  style="color:red;" > <% if(alreadyaddedpermission != null){ out.println(alreadyaddedpermission); }%></div>
                    <ul role="list" class="border border-gray-200 rounded-md divide-y divide-gray-200">
                        <%--list one--%>
                        <% List<RolePermissionDto> rolePermissions = (List<RolePermissionDto>) request.getAttribute("permissionsForSelectRole"); %>
                        <%--list two--%>
                        <% if (rolePermissions != null) {
                            for (int i = 0; i < rolePermissions.size(); i++) {
                                RolePermissionDto rolePermission = (RolePermissionDto) rolePermissions.get(i);

                        %>
                        <li class="pl-3 pr-4 py-3 flex items-center justify-between text-sm">
                            <div class="w-0 flex-1 flex items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 22 22"
                                     stroke="currentColor" class="flex-shrink-0 h-5 w-5 dark:text-white text-gray-400">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                          d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                </svg>

                                <span class="ml-2 flex-1 w-0 truncate dark:text-white"> <%=rolePermission.getPermissionName() %></span>
                            </div>
                            <div class="ml-4 flex-shrink-0">
                                <form id="frmdeletePermission" name="frmdeletePermission" method="post" action="<%=request.getContextPath()%>/deletePermissionsForSelectedRole" >
                                <input type="hidden" id="selectedPermissionId" name="selectedPermissionId" value="<%=rolePermission.getPermissionId() %>" />
<%--                                <a onclick="javascript:deletePermissionfromRole('<%=rolePermission.getId() %>')" class="font-medium text-red-600 hover:text-red-700 underline"> Delete--%>
<%--                                    Permission </a>--%>
                                    <button id="btnDeleteUser" type="button" data-modal-target="deleteModel" data-modal-toggle="deleteModel" onclick="" class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900">        Delete
                                    </button>

                                    <!-- Delete Permission modal --><div id="deleteModel" tabindex="-1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50 hidden p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full  w-full">    <form id="frmDelete" name="frmDelete" action="<%=request.getContextPath()%>/deleteUserFromAdminPanel" method="Post" class="space-y-4 md:space-y-6 w-1/4" >        <input id="selectedUserId" name="selectedUserId" type="hidden" value="">        <div class="relative w-full max-w-2xl max-h-full">            <!-- Modal content -->            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">                <!-- Modal header -->                <div class="flex items-start justify-between p-4 border-b rounded-t dark:border-gray-600">                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">                        Confirm Delete
                                </h3>                    <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white" onclick="" data-modal-hide="deleteModel">                        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">                            <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>                        </svg>                        <span class="sr-only">Close modal</span>                    </button>                </div>                <!-- Modal body -->                <div class="flex flex-col justify-center py-8  mx-auto lg:py-0">                    <div class="p-6 space-y-4 md:space-y-6 sm:p-8">                        <p class="text-sm leading-tight tracking-tight text-gray-900 md:text-sm dark:text-white">Are you sure you want to delete this Permission ?</p>                        <br>                    </div>                </div>                <!-- Modal footer -->                <div class="flex items-center p-6 space-x-2 border-t border-gray-200 rounded-b dark:border-gray-600">                    <button data-modal-hide="deleteModel" type="button" onclick="javascript:deletePermissionfromRole('<%=rolePermission.getId() %>')" class="text-white bg-red-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">                        Delete
                                </button>                    <button data-modal-hide="deleteModel" type="button" onclick="" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600">                        Cancel
                                </button>                </div>            </div>        </div>
                                </form>
                            </div>
                        </li>
                        <% }
                        } %>
                        <%-- list three--%>

                    </ul>

                </dd>
            </div>
            <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4">
                <dt class="text-sm font-medium dark:text-white text-gray-500">Add Permission</dt>
                <dd class="mt-1 text-sm  text-gray-900 sm:mt-0 sm:col-span-2">
                    <ul role="list" class="border border-gray-200 rounded-md divide-y divide-gray-200">
                        <li class="pl-3 pr-4 py-3 flex items-center justify-between text-sm">
                            <div class="w-0 flex-1 flex items-center">
                                <!-- Heroicon name: solid/paper-clip -->
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20"
                                     strokeWidth={1.5} stroke="currentColor"
                                     class="flex-shrink-0 h-5 w-5 dark:text-white text-gray-400">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                          d="M10.05 4.575a1.575 1.575 0 10-3.15 0v3m3.15-3v-1.5a1.575 1.575 0 013.15 0v1.5m-3.15 0l.075 5.925m3.075.75V4.575m0 0a1.575 1.575 0 013.15 0V15M6.9 7.575a1.575 1.575 0 10-3.15 0v8.175a6.75 6.75 0 006.75 6.75h2.018a5.25 5.25 0 003.712-1.538l1.732-1.732a5.25 5.25 0 001.538-3.712l.003-2.024a.668.668 0 01.198-.471 1.575 1.575 0 10-2.228-2.228 3.818 3.818 0 00-1.12 2.687M6.9 7.575V12m6.27 4.318A4.49 4.49 0 0116.35 15m.002 0h-.002"/>
                                </svg>
                                <span class="ml-2 flex-1 w-0 truncate dark:text-white"> Add Here if you want add permission to Admin </span>
                            </div>
                            <div class="ml-4 flex-shrink-0">
                                <a onclick="javascript:loadAddPermissionPopup()" data-modal-target="defaultModal"
                                   data-modal-toggle="defaultModal"
                                   class="font-medium dark:text-white text-indigo-600 hover:text-indigo-500 underline">
                                    Add Permission </a>
                            </div>
                        </li>
                    </ul>
                </dd>
            </div>
        </dl>


    </div>
</div>

<!-- popup modal -->
<div id="defaultModal" tabindex="-1" aria-hidden="true"
     class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative w-full max-w-2xl max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-start justify-between p-4 border-b rounded-t dark:border-gray-600">
                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                    Permissions
                </h3>
                <button type="button"
                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                        data-modal-hide="defaultModal">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                              clip-rule="evenodd"></path>
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <!-- Modal body -->

            <form id="frmAddPermission" name="frmAddPermission" method="post"
                  action="<%=request.getContextPath()%>/savePermissionsForSelectedRole">
                <div class="relative overflow-x-auto shadow-md  ">
                    >
                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                        <tbody>
                        <%--item 1--%>
                        <tr class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
                            <th scope="row"
                                class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                Role
                            </th>

                            <td class="px-6 py-4">
                                <div class="flex flex-row">
                                    <input name="AddPermissionPopupSelectedRole" id="AddPermissionPopupSelectedRole"
                                           type="text" value="" placeholder="Role"
                                           class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                           readonly>

                                    <input id="AddPermissionPopupSelectedRoleId" name="AddPermissionPopupSelectedRoleId"
                                           type="hidden" value=""/>
                                </div>
                            </td>
                        </tr>
                        <%--item 2--%>
                        <tr class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
                            <th scope="row"
                                class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                Permission Key
                            </th>

                            <td class="px-6 py-4">
                                <div class="flex flex-row">
                                    <div class="px-1">
                                        <!--        <input name="perKey" id="perKey" type="text" value="" placeholder="Permission Key"
                                                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">  -->

                                        <select name="dropdownSelectPermission" id="dropdownSelectPermission"
                                                onchange="javascript:copyselectedPermission()">
                                            <%


                                                if (request.getAttribute("Permissions") != null)  // Null check for the object
                                                {

                                                    List<PermissionDto> permissions = (List<PermissionDto>) request.getAttribute("Permissions");

                                                    if (permissions != null) {

                                                        for (int j = 0; j < permissions.size(); j++) {
                                                            PermissionDto permission = permissions.get(j);

                                                            //          if(selRoleName != null && (selRoleName.trim().equals(permission.getName())) ){


                                            %>


                                            <!--     <option value="<%=permission.getId() %>"  selected ><%=permission.getName() %></option>   -->

                                            <% //}else{ %>

                                            <option value="<%=permission.getId() %>"><%=permission.getName() %>
                                            </option>

                                            <%
                                                            //  }
                                                        }

                                                    }

                                                }
                                            %>
                                        </select>

                                    </div>

                                    <input id="selectedPermissionKey" name="selectedPermissionKey" type="hidden"
                                           value=""/>

                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Modal footer -->
                <div class="flex items-center p-6 space-x-2 border-t border-gray-200 rounded-b dark:border-gray-600">
                    <button onclick="javascript:addPermission()" data-modal-hide="defaultModal" type="button"
                            class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600">
                        Add
                    </button>
                    <button data-modal-hide="defaultModal" type="button"
                            class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600">
                        Cancel
                    </button>
                </div>

            </form>

        </div>
    </div>
</div>


<script src="https://flowbite.com/docs/flowbite.min.js"></script>
<script src="https://flowbite.com/docs/datepicker.min.js"></script>
</body>


<script type="text/javascript">

    function loadPermissionForSelectedRole() {


        var sRole = document.getElementById("dropdownSelectRole");
        var sSelectedRolename = document.getElementById("selectedRolename");
        var sSelectedRoleId = document.getElementById("selectedRoleId");
        var text = sRole.options[sRole.selectedIndex].text;
        var val = sRole.options[sRole.selectedIndex].value;
        console.log(" selected value=" + val);
        sSelectedRoleId.value = val;
        sSelectedRolename.value = text;

        document.getElementById("frmLoadPermissionByRoleId").submit();


    }


</script>

</html>
