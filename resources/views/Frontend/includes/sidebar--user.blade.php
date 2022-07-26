
    <div class="sidebar" id="sidebar">
        <div class="logo-details">
        <i class='bx bxl-c-plus-plus icon'></i>
        </svg>
            <div class="logo_name">{{__(config('app_name', 'DrillApp'))}}</div>
            <i class='bx bx-log-in' id="btn" ></i>
        </div>
        <ul class="nav-list">
        <li>
            <i class='bx bx-search' ></i>
            <input type="text" placeholder="Search...">
            <span class="tooltip">Search</span>
        </li>
        <li>
            <a href="#">
            <i class='bx bx-grid-alt'></i>
            <span class="links_name">Dashboard</span>
            </a>
            <span class="tooltip">Dashboard</span>
        </li>
        <li>
        <a href="#">
            <i class='bx bx-user' ></i>
            <span class="links_name">User</span>
        </a>
        <span class="tooltip">User</span>
        </li>
        <li>
        <a href="#">
            <i class='bx bx-chat' ></i>
            <span class="links_name">Messages</span>
        </a>
        <span class="tooltip">Messages</span>
        </li>
        <li>
        <a href="#">
            <i class='bx bx-pie-chart-alt-2' ></i>
            <span class="links_name">Analytics</span>
        </a>
        <span class="tooltip">Analytics</span>
        </li>
        <li>
        <a href="#">
            <i class='bx bx-folder' ></i>
            <span class="links_name">File Manager</span>
        </a>
        <span class="tooltip">Files</span>
        </li>
        <li>
        <a href="#">
            <i class='bx bx-cart-alt' ></i>
            <span class="links_name">Order</span>
        </a>
        <span class="tooltip">Order</span>
        </li>
        <li>
        <a href="#">
            <i class='bx bx-heart' ></i>
            <span class="links_name">Saved</span>
        </a>
        <span class="tooltip">Saved</span>
        </li>
        <li>
        <a href="#">
            <i class='bx bx-cog' ></i>
            <span class="links_name">Setting</span>
        </a>
        <span class="tooltip">Setting</span>
        </li>
        <li class="profile">
            <div class="profile-details">
            <!--<img src="profile.jpg" alt="profileImg">-->
            <div class="name_job">
                <div class="name">User Name</div>
                <div class="job">Admin</div>
            </div>
            </div>
            <i class='bx bx-cuboid' id="log_out" ></i>
        </li>
        </ul>
    </div>
    <script>
    let sidebar = document.querySelector(".sidebar");
    let closeBtn = document.querySelector("#btn");
    let searchBtn = document.querySelector(".bx-search");
    var closedSidebarWidth = document.getElementById('sidebar').offsetWidth;
    closeBtn.addEventListener("click", ()=>{
        sidebar.classList.toggle("open");
        menuBtnChange();//calling the function(optional)
    });

    searchBtn.addEventListener("click", ()=>{ // Sidebar open when you click on the search icon
        sidebar.classList.toggle("open");
        menuBtnChange(); //calling the function(optional)
    });

    // following are the code to change sidebar button(optional)
    function menuBtnChange() {
        if(sidebar.classList.contains("open")){
            var openedSidebarWidth = document.getElementById('sidebar').offsetWidth;
            closeBtn.classList.replace("bx-log-in", "bx-log-out");//replacing the icons class
            var diff = openedSidebarWidth - closedSidebarWidth;
            document.getElementById('home-section').style.marginLeft = diff + 'px';
        }else {
            closeBtn.classList.replace("bx-log-out","bx-log-in");//replacing the icons class
            document.getElementById('home-section').style.marginLeft = 0;
        }
    }
    </script>