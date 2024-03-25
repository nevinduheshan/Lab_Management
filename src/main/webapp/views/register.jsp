<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title>User Registration</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron&family=Poppins:wght@600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- Include iziToast CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/css/iziToast.min.css">
    <!-- Include iziToast JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/js/iziToast.min.js"></script>
    <%--  Alerts  --%>
    <script src="<%=request.getContextPath()%>/js/alert.js"></script>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

    html, body {
        font-family: 'Roboto', sans-serif;
    }

    .break-inside {
        -moz-column-break-inside: avoid;
        break-inside: avoid;
    }

    body {
        display: flex;
        justify-content: space-between;
        flex-direction: column;
        min-height: 100vh;
        line-height: 1.5;
    }

    .titlede{
        font-family: 'Orbitron', sans-serif;
    }

</style>
<script>

        function validateForm(){
            var passwordValid = validatePassword();
            var mobileNumberValid = validateMobileNumber();
            var userNameValid = validateUsername();

            return passwordValid && mobileNumberValid && userNameValid;
        }

        // password validation
        function validatePassword() {
            var password = document.getElementById("password").value;
            var errorElement = document.getElementById("errorpass");

            // Check for empty string or null value
            if (!password || password.trim() === "") {
                errorElement.innerHTML = "Password cannot be empty.";
                return false;
            }

            // Length requirement
            if (password.length < 8) {
                errorElement.innerHTML = "Password must be at least 8 characters long.";
                return false;
            }

            // Complexity requirements
            var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]+$/;
            if (!regex.test(password)) {
                errorElement.innerHTML = "Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
                return false;
            }
            //password is valid
            errorElement.innerHTML = "";
            return true;
        }

        // // mobile-number validation
        // function validateMobileNumber() {
        //     var phone = document.getElementById("phone").value;
        //     var errorElement = document.getElementById("errornum");
        //
        //     var regex = /^\d{10,15}$/;
        //     if (!regex.test(phone)) {
        //         errorElement.innerHTML = "Invalid mobile number. Please enter a number between 8 and 15 digits.";
        //         return false;
        //     }
        //     errorElement.innerHTML = "";
        //     return true;
        // }

        // username validation
        function validateUsername(){
            var username = document.getElementById("username").value;
            var errorElement = document.getElementById("usernameError");

            // Check for empty string or null value
            if (!username || username.trim() === "") {
                errorElement.innerHTML = "Username cannot be empty.";
                return false;
            }

            // Check for spaces
            if (/\s/.test(username)) {
                errorElement.innerHTML = "Username cannot contain spaces.";
                return false;
            }

            if (username.length < 8) {
                errorElement.innerHTML = "username must be at least 8 characters long.";
                return false;
            }

            // Only simple and block letters allowed
            var regex = /^[a-z]+$/;
            if (!regex.test(username)) {
                errorElement.innerHTML = "Username can only contain lowercase letters.";
                return false;
            }

            errorElement.innerHTML = ""; // Clear the error message if the username is valid
            return true;
        }

        function showSuccessPopup() {
            var popup = document.getElementById("successPopup");
            popup.classList.remove("hidden");
        }
        function errorHandle(invalidRegister) {
            msgBox("error", invalidRegister, "bottomRight");
        }
        function pointLoginpage() {
             document.getElementById("frmLogin").action='<%=request.getContextPath()%>/index';
             document.getElementById("frmLogin").submit();
        }

        function hideSuccessPopup() {
            var popup = document.getElementById("successPopup");
            popup.classList.add("hidden");
        }


</script>
<%
    String successRegister = (String) request.getAttribute("success");
    String invalidRegister = (String) request.getAttribute("invalidMessage");
%>
<body class="bg-white" <% if(successRegister != null){ %>
      onload="javascript:showSuccessPopup()"
        <% } else if (invalidRegister != null) { %>
        onload="javascript:errorHandle('<%=invalidRegister%>')"
        <% } %>
>
<div class="flex min-h-screen">

    <!-- Container -->
    <div class="flex flex-row w-full">

        <!-- Sidebar -->
        <div class='hidden lg:flex flex-col justify-between bg-[#F5FE83] lg:p-8 xl:p-12 lg:max-w-sm xl:max-w-lg'>
            <div class="flex items-center justify-start space-x-3">
                <span class="bg-black rounded-full w-8 h-8"></span>
                <a href="<%=request.getContextPath()%>/" class="font-medium text-xl titlede">LAB Manage</a>
            </div>
            <div class='space-y-5'>
                <h1 class="lg:text-3xl xl:text-5xl xl:leading-snug font-extrabold text-[#0D0920] titlede">Achieve your health goals with ABC</h1>
                <p class="text-lg">If you have account</p>
                <form name="frmLogin" id="frmLogin" action="<%=request.getContextPath()%>/index">
                    <button
                            type="submit"
                            class="inline-block flex-none px-4 py-3 border-2 rounded-lg font-medium border-black bg-black text-white titlede">
                        Log In
                    </button>
                </form>
            </div>

            <p class="font-medium">© Nevindu Heshan </p>

        </div>

        <!-- Login -->
        <div class="flex flex-1 flex-col items-center justify-center px-10 relative">
            <div class="flex lg:hidden justify-between items-center w-full py-4">
                <div class="flex items-center justify-start space-x-3">
                    <span class="bg-black rounded-full w-6 h-6"></span>
                    <a href="<%=request.getContextPath()%>/" class="font-medium text-lg md:text-xl sm:text-3xl">LAB Manage</a>
                </div>
                <div class="flex items-center space-x-2 ">
                    <span>Alredy registerd </span>
                    <a href="<%=request.getContextPath()%>/index" class="underline font-medium text-[#070eff]">
                        Log In
                    </a>
                </div>
            </div>
            <!-- Register box -->

            <form name="frmnewregister" id="frmnewregister" action="<%=request.getContextPath()%>/newuserregister" method="post" onsubmit="return validateForm()" class="flex flex-1 flex-col  justify-center space-y-5 max-w-md">

                <div class="flex flex-col space-y-2 text-center">
                    <h2 class="text-3xl md:text-4xl font-bold titlede">Sign Up Now</h2>
                    <p class="text-md md:text-xl">Please fill out this to register in to gym</p>
                </div>
                <div class="flex flex-col max-w-md">
                    <div class="flex md:flex-row max-w-md  flex-col ">
                        <div class="md:mx-1 mx-0">
                            <h1 class="font-bold ml-1">First name</h1>
                            <input name="first_name" required id="first_name" type="text" value="" class=" flex px-3 py-2 md:px-4 md:py-3 border-2 border-black rounded-lg font-medium placeholder:font-normal" placeholder="Firstname">
                        </div>
                        <div class="md:mx-1">
                            <h1 class="font-bold ml-1">Last Name</h1>
                            <input name="last_name" required id="last_name" type="text" value="" placeholder="Lastname" class="flex px-3 py-2 md:px-4 md:py-3 border-2 border-black rounded-lg font-medium placeholder:font-normal">
                        </div>
                    </div>
                    <h1 class="mt-4 ml-1 font-bold">Phone Number</h1>
                    <input name="phone" required id="phone"  type="text" value="" placeholder="Phone Number" class=" flex px-3 py-2 md:px-4 md:py-3 border-2 border-black rounded-lg font-medium placeholder:font-normal">
                    <span id="errornum" class="font-bold text-sm text-red-800"></span>
                    <h1 class="mt-4 ml-1 font-bold">Email</h1>
                    <input name="email" required id="email" type="email" value="" placeholder="Email Address" class=" flex px-3 py-2 md:px-4 md:py-3 border-2 border-black rounded-lg font-medium placeholder:font-normal">
                    <h1 class="mt-4 ml-1 font-bold">Username</h1>
                    <input name="username" id="username" type="text" value="" placeholder="Username" class=" flex px-3 py-2 md:px-4 md:py-3 border-2 border-black rounded-lg font-medium placeholder:font-normal">
                    <span id="usernameError" class="font-bold text-sm text-red-800"></span>
                    <h1 class="mt-4 ml-1 font-bold">Password</h1>
                    <input name="password"   id="password" type="password" value="" placeholder="Password" class=" flex px-3 py-2 md:px-4 md:py-3 border-2 border-black rounded-lg font-medium placeholder:font-normal">
                    <span id="errorpass" class="font-bold text-sm text-red-800"></span>

                    <button type="submit"  type="button"

                            class="titlede flex items-center justify-center flex-none px-3 py-2 md:px-4 md:py-3 border-2 rounded-lg font-medium border-black bg-black text-white mt-4">
                        Register
                    </button>

                </div>
            </form>

        </div>
    </div>

</div>
<div
        id="successPopup"
        tabindex="-1"
        aria-hidden="true"
        class="fixed popup top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full"
>
    <div class="w-full max-w-3xl max-h-3xl">
        <!-- Modal content -->
        <div class="shadow bg-gray-900">
            <!-- Modal body -->
            <div class="py-24 md:px-14 px-5 ">
                <div class="">
                    <h1
                            class="uppercase text-yellow-300 text-3xl md:text-6xl lg:text-6xl py-4 titlede"
                    >
                        Register successfull!
                    </h1>
                    <p
                            class="text-base leading-relaxed text-white mb-4 titlede"
                    >
                        Thank you for joining US.
                        <br />
                        Please click "OK" to login with your new credentials.
                    </p>
                </div>
                <!-- Modal footer -->
                <div class="flex items-center">
                    <button
                            data-modal-hide="staticModal"
                            type="button" onclick="javascript:pointLoginpage()"
                            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                    >
                        OK
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function showPassword() {
        var x = document.getElementById("password");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    }
</script>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://flowbite.com/docs/flowbite.min.js"></script>
<script src="https://flowbite.com/docs/datepicker.min.js"></script>
</body>
</html>