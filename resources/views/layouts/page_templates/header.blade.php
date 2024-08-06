<header class="d-flex flex-wrap text-center py-3 mb-4 border-bottom col-sm-12" style="background: linear-gradient(60deg, #3563ca, #557dd4) !important;">
    <div class="row logo col-sm-12" style="padding-right: 0px; padding-left: 0px;">
        <div class="col-sm-1" style="padding-right: 0px">
            <div class="navbar-wrapper">
                <div class="navbar-minimize">
                <button id="minimizeSidebar" class="btn btn-just-icon btn-white btn-fab btn-link">
                    <i class="material-icons text_align-center visible-on-sidebar-regular">more_vert</i>
                    <i class="material-icons design_bullet-list-67 visible-on-sidebar-mini">view_list</i>
                </button>
                </div>
                <a class="navbar-brand" href="#pablo"></a>
            </div>
        </div>
        <div class="col-sm-1 text-center" style="padding-right: 0px; padding-left: 0px;min-width: 74px !important; display : flex; align-items : center; justify-content: center;">
            <a href="https://neda.gov.ph/" title="National Economic and Development Authority" rel="home">
                <img class="text-center ml-auto mr-auto" src="{{ asset('material') }}/img/logowhite.png" height="80" width="80" style=""/>
            </a>
        </div>
        <div class="col-sm-6 text-left" style="padding-left: 10px; padding-right: 0px; display : flex; align-items : center;">
            <span style="color: white; text-align: left; line-height: 1.50; font-size: 1rem; font-family: 'Times New Roman';">REPUBLIC OF THE PHILIPPINES<hr style="border: 0.5px solid white; border-radius: 1px; margin-top: 3px; margin-bottom: 3px;"><span style="font-size: 1.15rem">NATIONAL ECONOMIC AND DEVELOPMENT AUTHORITY</span></span>
        </div>
        <div class="col-sm-4 text-right" style="padding-right: 0px; padding-left: 0px;min-width: 220px !important;">
          <span class="" id="pst-time" style="font-size: 0.90rem; color: white;"></span>
          <br>
          <span style="font-size: 0.90rem; color: white;">({{ auth()->user()->role->name }})</span>
        </div>
    </div>
</header>

@push('timer')
    <script type="text/javascript" id="gwt-pst">
        (function(d, eId) {
            var js, gjs = d.getElementById(eId);
            js = d.createElement('script'); js.id = 'gwt-pst-jsdk';
            js.src = "//gwhs.i.gov.ph/pst/gwtpst.js?"+new Date().getTime();
            gjs.parentNode.insertBefore(js, gjs);
        }(document, 'gwt-pst'));
        
        var gwtpstReady = function(){
            var firstPst = new gwtpstTime('pst-time');
        }
    </script>
@endpush

{{-- <header class="d-flex flex-wrap text-left py-3 mb-4 border-bottom px-10" style="background: linear-gradient(60deg, #3563ca, #557dd4) !important;">
    <h1 class="logo"><a href="https://neda.gov.ph/" title="National Economic and Development Authority" rel="home"><img src="{{ asset('material') }}/img/neda_header.png" /></a></h1>
</header> --}}
