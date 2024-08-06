<div class="wrapper ">
  @include('layouts.navbars.sidebar')
  <div class="main-panel"> 
    @include('layouts.page_templates.header')
    @include('layouts.navbars.navs.auth')
    @yield('content')
    @include('layouts.footers.auth')
  </div>
</div>