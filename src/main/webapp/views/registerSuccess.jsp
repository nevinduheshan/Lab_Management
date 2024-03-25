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

</style>
<body class="bg-white">

<div class="flex min-h-screen">

    <!-- Container -->
    <div class="flex flex-row w-full">

        <!-- Sidebar -->
        <div class='hidden lg:flex flex-col justify-between bg-[#F5FE83] lg:p-8 xl:p-12 lg:max-w-sm xl:max-w-lg'>
            <div class="flex items-center justify-start space-x-3">
                <span class="bg-black rounded-full w-8 h-8"></span>
                <a href="<%=request.getContextPath()%>/" class="font-medium text-xl">LAB Manage</a>
            </div>
            <div class='space-y-5'>
                <h1 class="lg:text-3xl xl:text-5xl xl:leading-snug font-extrabold">Enter your account and discover new experiences</h1>
                <p class="text-lg">If you have account</p>
                <form action="<%=request.getContextPath()%>/index">
                    <button
                            type="submit"
                            class="inline-block flex-none px-4 py-3 border-2 rounded-lg font-medium border-black bg-black text-white">
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
                    <span>Already registered </span>
                    <a href="<%=request.getContextPath()%>/index" class="underline font-medium text-[#070eff]">
                        Log In
                    </a>
                </div>
            </div>
            <!-- Login box -->
            <% String firstname = (String)request.getAttribute("firstname");
                String lastname = (String)request.getAttribute("lastname");
                String mobile = (String)request.getAttribute("phone");
                String email = (String)request.getAttribute("email");
                String username = (String)request.getAttribute("username");
            %>
            <form action="<%=request.getContextPath()%>/newuserregister" method="post" class="flex flex-1 flex-col  justify-center space-y-5 max-w-md">

                <div class="flex flex-col space-y-2 text-center">
                    <h2 class="text-3xl md:text-4xl font-bold">Sign Up Completed</h2>
                    <p class="text-md md:text-xl">Please check out your details .....................</p>
                </div>

                <div class="flex flex-col max-w-md space-y-5">
                    <input name="first_name" required id="first_name" type="text" value="<%=firstname %>" class="flex px-3 py-2 md:px-4 md:py-3 border-2 border-black rounded-lg font-medium placeholder:font-normal" placeholder="firstname">
                    <input name="last_name" required id="last_name" type="text" value="<%=lastname%>" placeholder="lastname" class="flex px-3 py-2 md:px-4 md:py-3 border-2 border-black rounded-lg font-medium placeholder:font-normal">
                    <input name="phone" required id="phone" type="text" value="<%=mobile%>" placeholder="070123457" class="flex px-3 py-2 md:px-4 md:py-3 border-2 border-black rounded-lg font-medium placeholder:font-normal">
                    <input name="email" required id="email" type="email" value="<%=email%>" placeholder="john.doe@company.com" class="flex px-3 py-2 md:px-4 md:py-3 border-2 border-black rounded-lg font-medium placeholder:font-normal">
                    <input name="username" required id="username" type="text" value="<%=username%>" placeholder="username" class="flex px-3 py-2 md:px-4 md:py-3 border-2 border-black rounded-lg font-medium placeholder:font-normal">

                    <% String str = (String) request.getAttribute("message");
                        if(str != null) {   %>

                    <div role="alert">
                        <h1 class="font-bold text-sm text-green-800"><%=str%>! </h1>


                    </div>

                    <%
//                            out.println(str);
                        }
                    %>






                </div>
            </form>

            <!-- Footer -->
            <div class="flex justify-center flex-col m-auto mb-16 text-center text-lg text-gray-400 ">
                <p class="font-bold">Built by <a href="#" class="underline">Nevindu Heshan</a></p>
                <%--<p>Contact me on the different platforms and social networks</p>--%>
                <div class="flex items-center justify-center space-x-2  flex-wrap"><a
                        href="https://www.linkedin.com/in/frankuxui/"
                        class="flex flex-none items-center justify-center rounded-full w-12 h-12 hover:bg-slate-200 transition-all dark:hover:bg-slate-700">
                    <svg
                            width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="4.983" cy="5.009" r="2.188" fill="currentColor"></circle>
                        <path
                                d="M9.237 8.855v12.139h3.769v-6.003c0-1.584.298-3.118 2.262-3.118 1.937 0 1.961 1.811 1.961 3.218v5.904H21v-6.657c0-3.27-.704-5.783-4.526-5.783-1.835 0-3.065 1.007-3.568 1.96h-.051v-1.66H9.237zm-6.142 0H6.87v12.139H3.095z"
                                fill="currentColor"></path>
                    </svg>
                </a><a href="https://www.figma.com/@frankuxui"
                       class="flex flex-none items-center justify-center rounded-full w-12 h-12 hover:bg-slate-200 transition-all dark:hover:bg-slate-700">
                    <svg
                            width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path
                                d="M15.332 8.668a3.333 3.333 0 0 0 0-6.663H8.668a3.333 3.333 0 0 0 0 6.663 3.333 3.333 0 0 0 0 6.665 3.333 3.333 0 0 0 0 6.664A3.334 3.334 0 0 0 12 18.664V8.668h3.332z"
                                fill="currentColor"></path>
                        <circle cx="15.332" cy="12" r="3.332" fill="currentColor"></circle>
                    </svg>
                </a><a href="https://dribbble.com/frankuxui"
                       class="flex flex-none items-center justify-center rounded-full w-12 h-12 hover:bg-slate-200 transition-all dark:hover:bg-slate-700">
                    <svg
                            width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path
                                d="M20.66 6.98a9.932 9.932 0 0 0-3.641-3.64C15.486 2.447 13.813 2 12 2s-3.486.447-5.02 1.34c-1.533.893-2.747 2.107-3.64 3.64S2 10.187 2 12s.446 3.487 1.34 5.02a9.924 9.924 0 0 0 3.641 3.64C8.514 21.553 10.187 22 12 22s3.486-.447 5.02-1.34a9.932 9.932 0 0 0 3.641-3.64C21.554 15.487 22 13.813 22 12s-.446-3.487-1.34-5.02zM12 3.66c2 0 3.772.64 5.32 1.919-.92 1.174-2.286 2.14-4.1 2.9-1.002-1.813-2.088-3.327-3.261-4.54A7.715 7.715 0 0 1 12 3.66zM5.51 6.8a8.116 8.116 0 0 1 2.711-2.22c1.212 1.201 2.325 2.7 3.34 4.5-2 .6-4.114.9-6.341.9-.573 0-1.006-.013-1.3-.04A8.549 8.549 0 0 1 5.51 6.8zM3.66 12c0-.054.003-.12.01-.2.007-.08.01-.146.01-.2.254.014.641.02 1.161.02 2.666 0 5.146-.367 7.439-1.1.187.373.381.793.58 1.26-1.32.293-2.674 1.006-4.061 2.14S6.4 16.247 5.76 17.5c-1.4-1.587-2.1-3.42-2.1-5.5zM12 20.34c-1.894 0-3.594-.587-5.101-1.759.601-1.187 1.524-2.322 2.771-3.401 1.246-1.08 2.483-1.753 3.71-2.02a29.441 29.441 0 0 1 1.56 6.62 8.166 8.166 0 0 1-2.94.56zm7.08-3.96a8.351 8.351 0 0 1-2.58 2.621c-.24-2.08-.7-4.107-1.379-6.081.932-.066 1.765-.1 2.5-.1.799 0 1.686.034 2.659.1a8.098 8.098 0 0 1-1.2 3.46zm-1.24-5c-1.16 0-2.233.047-3.22.14a27.053 27.053 0 0 0-.68-1.62c2.066-.906 3.532-2.006 4.399-3.3 1.2 1.414 1.854 3.027 1.96 4.84-.812-.04-1.632-.06-2.459-.06z"
                                fill="currentColor"></path>
                    </svg>
                </a><a href="https://codesandbox.io/u/frankuxui"
                       class="flex flex-none items-center justify-center rounded-full w-12 h-12 hover:bg-slate-200 transition-all dark:hover:bg-slate-700">
                    <svg
                            width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path
                                d="M2 6l10.455-6L22.91 6 23 17.95 12.455 24 2 18V6zm2.088 2.481v4.757l3.345 1.86v3.516l3.972 2.296v-8.272L4.088 8.481zm16.739 0l-7.317 4.157v8.272l3.972-2.296V15.1l3.345-1.861V8.48zM5.134 6.601l7.303 4.144 7.32-4.18-3.871-2.197-3.41 1.945-3.43-1.968L5.133 6.6z"
                                fill="currentColor"></path>
                    </svg>
                </a><a href="https://codepen.io/frankuxui"
                       class="flex flex-none items-center justify-center rounded-full w-12 h-12 hover:bg-slate-200 transition-all dark:hover:bg-slate-700">
                    <svg
                            width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path
                                d="M21.838 8.445c0-.001-.001-.001 0 0l-.003-.004-.001-.001v-.001a.809.809 0 0 0-.235-.228l-9.164-6.08a.834.834 0 0 0-.898 0L2.371 8.214A.786.786 0 0 0 2 8.897v6.16a.789.789 0 0 0 .131.448v.001l.002.002.01.015v.002h.001l.001.001.001.001c.063.088.14.16.226.215l9.165 6.082a.787.787 0 0 0 .448.139.784.784 0 0 0 .45-.139l9.165-6.082a.794.794 0 0 0 .371-.685v-6.16a.793.793 0 0 0-.133-.452zm-9.057-4.172 6.953 4.613-3.183 2.112-3.771-2.536V4.273zm-1.592 0v4.189l-3.771 2.536-3.181-2.111 6.952-4.614zm-7.595 6.098 2.395 1.59-2.395 1.611v-3.201zm7.595 9.311-6.96-4.617 3.195-2.15 3.765 2.498v4.269zm.795-5.653-3.128-2.078 3.128-2.105 3.131 2.105-3.131 2.078zm.797 5.653v-4.27l3.766-2.498 3.193 2.15-6.959 4.618zm7.597-6.11-2.396-1.611 2.396-1.59v3.201z"
                                fill="currentColor"></path>
                    </svg>
                </a><a href="https://tailwindcomponents.com/u/frankuxui"
                       class="flex flex-none items-center justify-center rounded-full w-12 h-12 hover:bg-slate-200 transition-all dark:hover:bg-slate-700">
                    <svg
                            width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path
                                d="M18.5 9.51a4.22 4.22 0 0 1-1.91-1.34A5.77 5.77 0 0 0 12 6a4.72 4.72 0 0 0-5 4 3.23 3.23 0 0 1 3.5-1.49 4.32 4.32 0 0 1 1.91 1.35A5.77 5.77 0 0 0 17 12a4.72 4.72 0 0 0 5-4 3.2 3.2 0 0 1-3.5 1.51zm-13 4.98a4.22 4.22 0 0 1 1.91 1.34A5.77 5.77 0 0 0 12 18a4.72 4.72 0 0 0 5-4 3.23 3.23 0 0 1-3.5 1.49 4.32 4.32 0 0 1-1.91-1.35A5.8 5.8 0 0 0 7 12a4.72 4.72 0 0 0-5 4 3.2 3.2 0 0 1 3.5-1.51z"
                                fill="currentColor"></path>
                    </svg>
                </a><a href="https://github.com/frankuxui"
                       class="flex flex-none items-center justify-center rounded-full w-12 h-12 hover:bg-slate-200 transition-all dark:hover:bg-slate-700">
                    <svg
                            width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path
                                d="M12,2A10,10 0 0,0 2,12C2,16.42 4.87,20.17 8.84,21.5C9.34,21.58 9.5,21.27 9.5,21C9.5,20.77 9.5,20.14 9.5,19.31C6.73,19.91 6.14,17.97 6.14,17.97C5.68,16.81 5.03,16.5 5.03,16.5C4.12,15.88 5.1,15.9 5.1,15.9C6.1,15.97 6.63,16.93 6.63,16.93C7.5,18.45 8.97,18 9.54,17.76C9.63,17.11 9.89,16.67 10.17,16.42C7.95,16.17 5.62,15.31 5.62,11.5C5.62,10.39 6,9.5 6.65,8.79C6.55,8.54 6.2,7.5 6.75,6.15C6.75,6.15 7.59,5.88 9.5,7.17C10.29,6.95 11.15,6.84 12,6.84C12.85,6.84 13.71,6.95 14.5,7.17C16.41,5.88 17.25,6.15 17.25,6.15C17.8,7.5 17.45,8.54 17.35,8.79C18,9.5 18.38,10.39 18.38,11.5C18.38,15.32 16.04,16.16 13.81,16.41C14.17,16.72 14.5,17.33 14.5,18.26C14.5,19.6 14.5,20.68 14.5,21C14.5,21.27 14.66,21.59 15.17,21.5C19.14,20.16 22,16.42 22,12A10,10 0 0,0 12,2Z"
                                fill="currentColor"></path>
                    </svg>
                </a><a href="https://www.instagram.com/frankuxui/"
                       class="flex flex-none items-center justify-center rounded-full w-12 h-12 hover:bg-slate-200 transition-all dark:hover:bg-slate-700">
                    <svg
                            width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path
                                d="M7.8,2H16.2C19.4,2 22,4.6 22,7.8V16.2A5.8,5.8 0 0,1 16.2,22H7.8C4.6,22 2,19.4 2,16.2V7.8A5.8,5.8 0 0,1 7.8,2M7.6,4A3.6,3.6 0 0,0 4,7.6V16.4C4,18.39 5.61,20 7.6,20H16.4A3.6,3.6 0 0,0 20,16.4V7.6C20,5.61 18.39,4 16.4,4H7.6M17.25,5.5A1.25,1.25 0 0,1 18.5,6.75A1.25,1.25 0 0,1 17.25,8A1.25,1.25 0 0,1 16,6.75A1.25,1.25 0 0,1 17.25,5.5M12,7A5,5 0 0,1 17,12A5,5 0 0,1 12,17A5,5 0 0,1 7,12A5,5 0 0,1 12,7M12,9A3,3 0 0,0 9,12A3,3 0 0,0 12,15A3,3 0 0,0 15,12A3,3 0 0,0 12,9Z"
                                fill="currentColor"></path>
                    </svg>
                </a><a href="https://dev.to/frankuxui"
                       class="flex flex-none items-center justify-center rounded-full w-12 h-12 hover:bg-slate-200 transition-all dark:hover:bg-slate-700">
                    <svg
                            width="28" height="28" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path
                                d="M7.73 11.93C7.73 13.65 7.71 13.76 7.5 14C7.31 14.17 7.12 14.23 6.74 14.23L6.23 14.24L6.2 11.97L6.18 9.7H6.7C7.05 9.7 7.3 9.77 7.47 9.91C7.71 10.12 7.73 10.16 7.73 11.93M22 7.5V16.5C22 17.61 21.11 18.5 20 18.5H4C2.89 18.5 2 17.61 2 16.5V7.5C2 6.39 2.89 5.5 4 5.5H20C21.11 5.5 22 6.39 22 7.5M8.93 11.73C8.9 9.89 8.88 9.74 8.64 9.34C8.24 8.66 7.79 8.5 6.28 8.5H5V15.5H6.21C7.54 15.5 8.1 15.33 8.5 14.79C8.91 14.26 9 13.81 8.93 11.73M13.12 8.5H11.64C10.15 8.5 10.14 8.5 9.93 8.78S9.7 9.21 9.7 12V14.96L9.97 15.23C10.22 15.5 10.28 15.5 11.68 15.5H13.12V14.31L12.03 14.27L10.93 14.24V12.6L11.61 12.57L12.27 12.53V11.34H10.88V9.7H13.12V8.5M19 8.56C19 8.5 18.7 8.5 18.34 8.5L17.66 8.56L17.07 10.91C16.69 12.39 16.45 13.18 16.4 13.04C16.32 12.77 15.26 8.6 15.26 8.55C15.26 8.5 14.95 8.5 14.58 8.5H13.89L14.3 10.05C14.5 10.92 14.89 12.33 15.11 13.2C15.45 14.55 15.57 14.85 15.86 15.14C16.06 15.36 16.31 15.5 16.47 15.5C16.8 15.5 17.23 15.16 17.37 14.77C17.5 14.5 19 8.69 19 8.56Z"
                                fill="currentColor"></path>
                    </svg>
                </a><a href="https://twitter.com/frankuxui"
                       class="flex flex-none items-center justify-center rounded-full w-12 h-12 hover:bg-slate-200 transition-all dark:hover:bg-slate-700">
                    <svg fill="#B9B9B9" width="28" height="28" version="1.1" id="Layer_1"
                         xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                         viewBox="0 0 503.489 503.489" xml:space="preserve">
                            <g>
                                <g>
                                    <g>
                                        <polygon
                                                points="220.047,247.161 123.509,150.624 111.435,162.69 207.972,259.236 			"/>
                                        <polygon
                                                points="51.096,223.027 39.03,235.094 135.568,331.64 147.634,319.565 			"/>
                                        <path d="M6.675,267.773c-4.258,4.25-6.596,9.907-6.596,15.923c0,6.007,2.338,11.665,6.596,15.915l58.479,58.479
                                            c5.914,5.914,13.781,9.173,22.144,9.173c8.371,0,16.23-3.26,22.144-9.173l14.063-14.063l-96.538-96.538L6.675,267.773z"/>
                                        <polygon
                                                points="195.91,271.299 99.363,174.753 63.165,210.96 159.703,307.506 			"/>
                                        <path d="M146.008,393.614c-6.016,6.007-9.318,14.003-9.318,22.502c0,8.499,3.302,16.486,9.318,22.494l58.411,58.428
                                            c4.309,4.301,9.967,6.451,15.625,6.451c5.658,0,11.324-2.15,15.633-6.46l20.574-20.582l-96.538-96.538L146.008,393.614z"/>
                                        <polygon
                                                points="244.182,295.438 340.719,391.976 352.794,379.909 256.256,283.363 			"/>
                                        <polygon
                                                points="171.778,367.842 268.316,464.38 280.39,452.314 183.844,355.776 			"/>
                                        <polygon
                                                points="195.912,343.709 292.45,440.247 328.657,404.048 232.119,307.502 			"/>
                                        <path d="M401.066,51.172c-13.688,0-26.547,5.316-36.207,14.967c-9.651,9.66-14.967,22.519-14.967,36.207
                                            c0,13.696,5.316,26.547,14.967,36.207c9.66,9.651,22.519,14.967,36.207,14.967c13.687,0,26.547-5.316,36.207-14.967
                                            c9.651-9.66,14.967-22.511,14.967-36.207c0-13.688-5.316-26.547-14.967-36.207C427.613,56.488,414.754,51.172,401.066,51.172z"/>
                                        <path d="M473.478,29.939c-37.385-37.385-96.734-39.757-136.917-7.125c-17.775-4.847-36.949-0.034-50.142,13.158l-90.505,90.513
                                            l-9.207-9.208c-7.97-7.979-21.879-7.979-29.858,0l-21.274,21.274l96.538,96.546l15.258-15.258
                                            c11.554-11.554,11.554-30.344,0-41.899l-3.191-3.183l55.962-55.962c3.311,20.497,12.749,40.183,28.518,55.962
                                            c15.77,15.77,35.465,25.207,55.962,28.518l-55.962,55.953l-2.944-2.944c-11.682-11.691-30.703-11.682-42.385,0l-15.01,15.01
                                            l96.538,96.546l21.803-21.803c3.849-3.84,5.965-8.96,5.965-14.404c0-5.436-2.116-10.556-5.965-14.404l-9.728-9.728l90.513-90.513
                                            c13.184-13.193,18.014-32.367,13.15-50.142C513.227,126.665,510.854,67.324,473.478,29.939z M449.338,150.618
                                            c-13.312,13.312-30.788,19.959-48.273,19.959s-34.961-6.647-48.265-19.959c-26.624-26.615-26.624-69.922,0-96.538
                                            c26.615-26.624,69.922-26.624,96.538,0C475.953,80.696,475.953,124.002,449.338,150.618z"/>
                                    </g>
                                </g>
                            </g>
</svg>
                </a></div>
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
</body>

</html>