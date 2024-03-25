<html>
<head>
<meta charset="utf-8" /><meta
        name="viewport"
        content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/main/webapp/components/assets/css/components-v2.css"  />
    <script type="text/javascript" src="<%=request.getContextPath()%>/css/components-v2.css"> </script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jscript/components-v2.js"> </script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jscript/ifra.js"> </script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jscript/alpine.js"> </script>
<script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
</head>
<body class="overflow-hidden font-sans antialiased bg-gray-200">
<div class="" style="">
    <div>
        <div
                x-data="{ open: false }"
                @keydown.window.escape="open = false"
                class="flex h-full"
        >
            <div
                    x-show="open"
                    class="fixed inset-0 z-40 flex lg:hidden"
                    x-description="Off-canvas menu for mobile, show/hide based on off-canvas menu state."
                    x-ref="dialog"
                    aria-modal="true"
            >
                <div
                        x-show="open"
                        x-transition:enter="transition-opacity ease-linear duration-300"
                        x-transition:enter-start="opacity-0"
                        x-transition:enter-end="opacity-100"
                        x-transition:leave="transition-opacity ease-linear duration-300"
                        x-transition:leave-start="opacity-100"
                        x-transition:leave-end="opacity-0"
                        x-description="Off-canvas menu overlay, show/hide based on off-canvas menu state."
                        class="fixed inset-0 bg-gray-600 bg-opacity-75"
                        @click="open = false"
                        aria-hidden="true"
                ></div>

                <div
                        x-show="open"
                        x-transition:enter="transition ease-in-out duration-300 transform"
                        x-transition:enter-start="-translate-x-full"
                        x-transition:enter-end="translate-x-0"
                        x-transition:leave="transition ease-in-out duration-300 transform"
                        x-transition:leave-start="translate-x-0"
                        x-transition:leave-end="-translate-x-full"
                        x-description="Off-canvas menu, show/hide based on off-canvas menu state."
                        class="relative flex flex-col flex-1 w-full max-w-xs bg-white focus:outline-none"
                >
                    <div
                            x-show="open"
                            x-transition:enter="ease-in-out duration-300"
                            x-transition:enter-start="opacity-0"
                            x-transition:enter-end="opacity-100"
                            x-transition:leave="ease-in-out duration-300"
                            x-transition:leave-start="opacity-100"
                            x-transition:leave-end="opacity-0"
                            x-description="Close button, show/hide based on off-canvas menu state."
                            class="absolute top-0 right-0 pt-2 -mr-12"
                    >
                        <button
                                type="button"
                                class="flex items-center justify-center w-10 h-10 ml-1 rounded-full focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white"
                                @click="open = false"
                        >
                            <span class="sr-only">Close sidebar</span>
                            <svg
                                    class="w-6 h-6 text-white"
                                    x-description="Heroicon name: outline/x"
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke="currentColor"
                                    aria-hidden="true"
                            >
                                <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M6 18L18 6M6 6l12 12"
                                ></path>
                            </svg>
                        </button>
                    </div>

                    <div class="flex-1 h-0 pt-5 pb-4 overflow-y-auto">
                        <div class="flex items-center flex-shrink-0 px-4">
                            <img
                                    class="w-auto h-8"
                                    src="https://tailwindui.com/img/logos/workflow-logo-pink-500-mark-gray-900-text.svg"
                                    alt="Workflow"
                            />
                        </div>
                        <nav aria-label="Sidebar" class="mt-5">
                            <div class="px-2 space-y-1">
                                <a
                                        href="#"
                                        class="flex items-center px-2 py-2 text-base font-medium text-gray-600 rounded-md hover:bg-gray-50 hover:text-gray-900 group"
                                        x-state:on="Current"
                                        x-state:off="Default"
                                        x-state-description='Current: "bg-gray-100 text-gray-900", Default: "text-gray-600 hover:bg-gray-50 hover:text-gray-900"'
                                >
                                    <svg
                                            class="w-6 h-6 mr-4 text-gray-400 group-hover:text-gray-500"
                                            x-state:on="Current"
                                            x-state:off="Default"
                                            x-state-description='Current: "text-gray-500", Default: "text-gray-400 group-hover:text-gray-500"'
                                            x-description="Heroicon name: outline/home"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                            aria-hidden="true"
                                    >
                                        <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"
                                        ></path>
                                    </svg>
                                    Dashboard
                                </a>

                                <a
                                        href="#"
                                        class="flex items-center px-2 py-2 text-base font-medium text-gray-600 rounded-md hover:bg-gray-50 hover:text-gray-900 group"
                                        x-state-description='undefined: "bg-gray-100 text-gray-900", undefined: "text-gray-600 hover:bg-gray-50 hover:text-gray-900"'
                                >
                                    <svg
                                            class="w-6 h-6 mr-4 text-gray-400 group-hover:text-gray-500"
                                            x-state-description='undefined: "text-gray-500", undefined: "text-gray-400 group-hover:text-gray-500"'
                                            x-description="Heroicon name: outline/calendar"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                            aria-hidden="true"
                                    >
                                        <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
                                        ></path>
                                    </svg>
                                    Calendar
                                </a>

                                <a
                                        href="#"
                                        class="flex items-center px-2 py-2 text-base font-medium text-gray-600 rounded-md hover:bg-gray-50 hover:text-gray-900 group"
                                        x-state-description='undefined: "bg-gray-100 text-gray-900", undefined: "text-gray-600 hover:bg-gray-50 hover:text-gray-900"'
                                >
                                    <svg
                                            class="w-6 h-6 mr-4 text-gray-400 group-hover:text-gray-500"
                                            x-state-description='undefined: "text-gray-500", undefined: "text-gray-400 group-hover:text-gray-500"'
                                            x-description="Heroicon name: outline/user-group"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                            aria-hidden="true"
                                    >
                                        <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"
                                        ></path>
                                    </svg>
                                    Teams
                                </a>

                                <a
                                        href="#"
                                        class="flex items-center px-2 py-2 text-base font-medium text-gray-900 bg-gray-100 rounded-md group"
                                        aria-current="page"
                                        x-state-description='undefined: "bg-gray-100 text-gray-900", undefined: "text-gray-600 hover:bg-gray-50 hover:text-gray-900"'
                                >
                                    <svg
                                            class="w-6 h-6 mr-4 text-gray-500"
                                            x-state-description='undefined: "text-gray-500", undefined: "text-gray-400 group-hover:text-gray-500"'
                                            x-description="Heroicon name: outline/search-circle"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                            aria-hidden="true"
                                    >
                                        <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M8 16l2.879-2.879m0 0a3 3 0 104.243-4.242 3 3 0 00-4.243 4.242zM21 12a9 9 0 11-18 0 9 9 0 0118 0z"
                                        ></path>
                                    </svg>
                                    Directory
                                </a>

                                <a
                                        href="#"
                                        class="flex items-center px-2 py-2 text-base font-medium text-gray-600 rounded-md hover:bg-gray-50 hover:text-gray-900 group"
                                        x-state-description='undefined: "bg-gray-100 text-gray-900", undefined: "text-gray-600 hover:bg-gray-50 hover:text-gray-900"'
                                >
                                    <svg
                                            class="w-6 h-6 mr-4 text-gray-400 group-hover:text-gray-500"
                                            x-state-description='undefined: "text-gray-500", undefined: "text-gray-400 group-hover:text-gray-500"'
                                            x-description="Heroicon name: outline/speakerphone"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                            aria-hidden="true"
                                    >
                                        <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M11 5.882V19.24a1.76 1.76 0 01-3.417.592l-2.147-6.15M18 13a3 3 0 100-6M5.436 13.683A4.001 4.001 0 017 6h1.832c4.1 0 7.625-1.234 9.168-3v14c-1.543-1.766-5.067-3-9.168-3H7a3.988 3.988 0 01-1.564-.317z"
                                        ></path>
                                    </svg>
                                    Announcements
                                </a>

                                <a
                                        href="#"
                                        class="flex items-center px-2 py-2 text-base font-medium text-gray-600 rounded-md hover:bg-gray-50 hover:text-gray-900 group"
                                        x-state-description='undefined: "bg-gray-100 text-gray-900", undefined: "text-gray-600 hover:bg-gray-50 hover:text-gray-900"'
                                >
                                    <svg
                                            class="w-6 h-6 mr-4 text-gray-400 group-hover:text-gray-500"
                                            x-state-description='undefined: "text-gray-500", undefined: "text-gray-400 group-hover:text-gray-500"'
                                            x-description="Heroicon name: outline/map"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                            aria-hidden="true"
                                    >
                                        <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7"
                                        ></path>
                                    </svg>
                                    Office Map
                                </a>
                            </div>
                            <hr
                                    class="my-5 border-t border-gray-200"
                                    aria-hidden="true"
                            />
                            <div class="px-2 space-y-1">
                                <a
                                        href="#"
                                        class="flex items-center px-2 py-2 text-base font-medium text-gray-600 rounded-md hover:bg-gray-50 hover:text-gray-900 group"
                                >
                                    <svg
                                            class="flex-shrink-0 w-6 h-6 mr-4 text-gray-400 group-hover:text-gray-500"
                                            x-description="Heroicon name: outline/view-grid-add"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                            aria-hidden="true"
                                    >
                                        <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M17 14v6m-3-3h6M6 10h2a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v2a2 2 0 002 2zm10 0h2a2 2 0 002-2V6a2 2 0 00-2-2h-2a2 2 0 00-2 2v2a2 2 0 002 2zM6 20h2a2 2 0 002-2v-2a2 2 0 00-2-2H6a2 2 0 00-2 2v2a2 2 0 002 2z"
                                        ></path>
                                    </svg>
                                    Apps
                                </a>

                                <a
                                        href="#"
                                        class="flex items-center px-2 py-2 text-base font-medium text-gray-600 rounded-md hover:bg-gray-50 hover:text-gray-900 group"
                                >
                                    <svg
                                            class="flex-shrink-0 w-6 h-6 mr-4 text-gray-400 group-hover:text-gray-500"
                                            x-description="Heroicon name: outline/cog"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                            aria-hidden="true"
                                    >
                                        <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"
                                        ></path>
                                        <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
                                        ></path>
                                    </svg>
                                    Settings
                                </a>
                            </div>
                        </nav>
                    </div>
                    <div class="flex flex-shrink-0 p-4 border-t border-gray-200">
                        <a href="#" class="flex-shrink-0 block group">
                            <div class="flex items-center">
                                <div>
                                    <img
                                            class="inline-block w-10 h-10 rounded-full"
                                            src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                            alt=""
                                    />
                                </div>
                                <div class="ml-3">
                                    <p
                                            class="text-base font-medium text-gray-700 group-hover:text-gray-900"
                                    >
                                        Tom Cook
                                    </p>
                                    <p
                                            class="text-sm font-medium text-gray-500 group-hover:text-gray-700"
                                    >
                                        View profile
                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>


            </div>

            <!-- Static sidebar for desktop -->

            <div class="flex flex-col flex-1 min-w-0 overflow-hidden">
                <div class="lg:hidden">

                        <div>
                            <button
                                    type="button"
                                    class="inline-flex items-center justify-center w-12 h-12 -mr-3 text-gray-500 rounded-md hover:text-gray-900 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-pink-600"
                                    @click="open = true"
                            >
                                <span class="sr-only">Open sidebar</span>
                                <svg
                                        class="w-6 h-6"
                                        x-description="Heroicon name: outline/menu"
                                        xmlns="http://www.w3.org/2000/svg"
                                        fill="none"
                                        viewBox="0 0 24 24"
                                        stroke="currentColor"
                                        aria-hidden="true"
                                >
                                    <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            stroke-width="2"
                                            d="M4 6h16M4 12h16M4 18h16"
                                    ></path>
                                </svg>
                            </button>
                        </div>

                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
