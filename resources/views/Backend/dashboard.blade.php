@extends('Backend.layouts.app')
@section('content')
<section class="home-section" id="home-section">
    <div class="text">Dashboard</div>
</section>
@endsection
@section('after-script')
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
@endsection
