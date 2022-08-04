
    <div class="sidebar" id="sidebar">
        <div class="logo-details">
        <i class='bx bxl-c-plus-plus icon'></i>
        </svg>
            <div class="logo_name">{{__(config('app_name', 'DrillApp'))}}</div>
            <i class='bx bx-log-in' id="btn" ></i>
        </div>
        <li>
            <i class='bx bx-search' ></i>
            <input type="text" placeholder="Search...">
            <span class="tooltip">Search</span>
        </li>
        <li @if ($module == "Projects")
            class={{'selected'}}
        @endif>
            <a href="{{route('user.project.index')}}">
                <i class='bx bx-grid-alt'></i>
                <span class="links_name">{{__('Projects')}}</span>
            </a>
            <span class="tooltip">{{__('Projects')}}</span>
            <span class="marker"></span>
        </li>
        <li @if ($module == "Survey")
            class={{'selected'}}
        @endif>
        <a href="{{route('user.survey.index')}}">
            <i class='bx bx-command' ></i>
            <span class="links_name">{{__('Trajectory')}}</span>
        </a>
        <span class="tooltip">{{__('Trajectory')}}</span>
        <span class="marker"></span>
        </li>
        <li @if ($module == "Formation")
            class={{'selected'}}
        @endif>
        <a href="{{route('user.formation.index')}}">
            <i class='bx bxs-keyboard'></i>
            <span class="links_name">{{__('Formation')}}</span>
        </a>
        <span class="tooltip">{{__('Formation')}}</span>
        <span class="marker"></span>
        </li>
        <li @if ($module == "Wellbore")
            class={{'selected'}}
        @endif>
        <a href="{{route('admin.wellbore.index')}}">
            <i class='bx bx-slider'></i>
            <span class="links_name">{{__('Wellbore')}}</span>
        </a>
        <span class="tooltip">{{__('Wellbore')}}</span>
        <span class="marker"></span>
        </li>
        <li @if ($module == "DrillString")
            class={{'selected'}}
        @endif>
        <a href="#">
            <i class='bx bx-dialpad-alt'></i>
            <span class="links_name">{{__('DrillString')}}</span>
        </a>
        <span class="tooltip">{{__('DrillString')}}</span>
        <span class="marker"></span>
        </li>
        <li @if ($module == "Fluids")
            class={{'selected'}}
        @endif>
        <a href="#">
            <i class='bx bx-droplet'></i>
            <span class="links_name">{{__('Fluids')}}</span>
        </a>
        <span class="tooltip">{{__('Fluids')}}</span>
        <span class="marker"></span>
        </li>
        <li @if ($module == "Simulation")
            class={{'selected'}}
        @endif>
        <a href="#">
            <i class='bx bx-package'></i>
            <span class="links_name">{{__('Simulation')}}</span>
        </a>
        <span class="tooltip">{{__('Simulation')}}</span>
        <span class="marker"></span>
        </li>
        <li @if ($module == "Analystics")
            class={{'selected'}}
        @endif>
            <a href="#">
                <i class='bx bx-analyse' ></i>
                <span class="links_name">{{__('Analystics')}}</span>
            </a>
            <span class="tooltip">{{__('Analystics')}}</span>
            <span class="marker"></span>
        </li>
        <li @if ($module == "Reports")
            class={{'selected'}}
        @endif>
            <a href="#">
                <i class='bx bx-book'></i>
                <span class="links_name">{{__('Reports')}}</span>
            </a>
            <span class="tooltip">{{__('Reports')}}</span>
            <span class="marker"></span>
        </li>
        <li @if ($module == "Units")
            class={{'selected'}}
        @endif>
            <a href="#">
                <i class='bx bx-ruler' ></i>
                <span class="links_name">{{__('Units')}}</span>
            </a>
            <span class="tooltip">{{__('Units')}}</span>
            <span class="marker"></span>
        </li>
        @if (session()->get('projectId'))
        <li @if ($module == "Details")
            class={{'selected'}}
        @endif>
            <a href="#">
                <i class='bx bx-detail'></i>
                <span class="links_name">{{__('Details')}}</span>
            </a>
            <span class="tooltip">{{__('Details')}}</span>
            <span class="marker"></span>
        </li>
        @endif
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
                closeBtn.classList.replace("bx-log-in", "bx-log-out");//replacing the icons class
                var openedSidebarWidth = document.getElementById('sidebar').offsetWidth;
                var diff = openedSidebarWidth - closedSidebarWidth;
                document.getElementById('home-section').style.marginLeft = 102 + 'px';
                var home_section_width = document.getElementById('home-section').offsetWidth;
                var sectionDiff = home_section_width - 102;
                document.getElementById('home-section').offsetWidth = sectionDiff;
            }else {
                closeBtn.classList.replace("bx-log-out","bx-log-in");//replacing the icons class
                document.getElementById('home-section').style.marginLeft = 0;
            }
        }
    </script>