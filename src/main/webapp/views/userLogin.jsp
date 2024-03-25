<!-- component -->
<html>
<head>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron&family=Poppins:wght@600&display=swap" rel="stylesheet">
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

<body class="bg-white">


<!-- Example -->
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
                <h1 class="lg:text-3xl xl:text-5xl xl:leading-snug font-extrabold text-[#0D0920] titlede">Please Login to continue our Health Journey.</h1>
                <p class="text-lg">You do not have an account?</p>
                <form action="<%=request.getContextPath()%>/register">
                    <button
                            type="submit"
                            class="inline-block flex-none px-4 py-3 border-2 rounded-lg font-medium border-black bg-[#0D0920] text-white titlede">
                        Create account here
                    </button>
                </form>
            </div>
<%--            <p class="font-bold">Admin Panel <a href="<%=request.getContextPath()%>/adminControl" class="underline text-blue-700 hover:text-red-600">Click Here</a></p>--%>
            <p class="font-medium">© Nevindu Heshan</p>
        </div>

        <!-- Login -->
        <div class="flex flex-1 flex-col items-center justify-center px-10 relative">
            <div class="flex lg:hidden justify-between items-center w-full py-4">
                <div class="flex items-center justify-start space-x-3">
                    <span class="bg-black rounded-full w-6 h-6"></span>
                    <a href="<%=request.getContextPath()%>/" class="font-medium text-lg md:text-xl sm:text-3xl titlede">LAB Manage</a>
                </div>
                <div class="flex items-center space-x-2 ">
                    <span>Not a member? </span>
                    <a href="<%=request.getContextPath()%>/register" class="underline font-medium text-[#070eff]">
                        Sign up now
                    </a>
                </div>
            </div>
            <!-- Login box -->

            <form action="<%=request.getContextPath()%>/userloginvalidate" method="post" class="flex flex-1 flex-col  justify-center space-y-5 max-w-md">

                <div class="flex flex-col space-y-2 text-center">
                    <h2 class="text-3xl md:text-4xl font-bold titlede">Sign in to account</h2>
                    <p class="text-md md:text-xl">Sign up or log in to place the order,no password require!</p>
                </div>
                <div class="flex flex-col max-w-md">
                    <h1 class="mt-4 ml-1 font-bold">Username</h1>
                    <input type="text" placeholder="Username" name="username" id="username" required
                           class="flex px-3 py-2 md:px-4 md:py-3 border-2 border-black rounded-lg font-medium placeholder:font-normal"/>

                    <h1 class="mt-4 ml-1 font-bold">Password</h1>
                    <input type="password" placeholder="Password" name="password" id="password" required
                           class="flex px-3 py-2 md:px-4 md:py-3 border-2 border-black rounded-lg font-medium placeholder:font-normal mb-4"/>
                    <% String message = (String) request.getAttribute("message");
                        if (message != null) { %>
                    <div role="alert">
                        <h1 class="font-bold text-sm text-red-800"><%=message%>! </h1>
                    </div>
                    <%
                            //                            out.println(message);
                        }
                    %>
                    <button type="submit"
                            class="flex items-center justify-center flex-none px-3 py-2 md:px-4 md:py-3 border-2 rounded-lg font-medium border-black bg-black text-white titlede">
                        Login
                    </button>



                </div>
            </form>

        </div>
    </div>

</div>
<!-- Example -->
</body>
</html>