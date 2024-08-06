<div class="sidebar" data-color="azure" data-background-color="black" data-image="{{ asset('material') }}/img/header.jpg">
  <!--
    Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

    Tip 2: you can also add an image using data-image tag
-->
  <div class="logo">
    {{-- <a href="https://ishelpdesk.neda.gov.ph/" class="simple-text">
      <img class="img" src="{{ asset('material') }}/img/logowhite.png" height="0" width="0">
    </a> --}}
    <a href="http://ishelpdesk.neda.gov.ph/home" class="simple-text logo-normal">
      <img class="img" src="{{ asset('material') }}/img/onlinelogomaker-070222-1608-9758-2000-transparent.png" height="70" width="245">
    </a>

  </div>
  <div class="sidebar-wrapper">
    <ul class="nav">
      <div class="user">
        <li class="nav-item {{ $menuParent == 'profile' ? ' active' : '' }}">
          <a class="nav-link" data-toggle="collapse" href="#collapseExample"
            {{ $menuParent == 'profile' ? ' aria-expanded="true"' : '' }}>
            @if (!empty(auth()->user()->picture))
              <i><img style="width:35px;height:35px;overflow:hidden;" src="{{ auth()->user()->profilePicture() }}" class="rounded-circle"></i>
            @else
              <i><img onclick="ocShowProfileModal()" style="width:35px;height:35px;overflow:hidden;position:relative;z-index:3000" src="{{ asset('material') }}/img/default-avatar.png" class="rounded-circle"/></i>
            @endif
            <p>
              {{ substr(auth()->user()->name, 0, 22) }}
              <b class="caret"></b>
            </p>
          </a>
          <div class="collapse {{ $menuParent == 'profile' ? ' show' : '' }}" id="collapseExample">
            <ul class="nav">
              <li class="nav-item{{ $activePage == 'profile-management' ? ' active' : '' }}">
                <a class="nav-link padleft35" href="{{ route('profile.edit') }}">
                  {{-- <span class="sidebar-mini"> MP </span> --}}
                  <i class="material-icons">account_circle</i>
                  <span class="sidebar-normal"> My Profile </span>
                </a>
              </li>

              <li class="nav-item{{ $activePage == 'logout' ? ' active' : '' }}">
                <a class="nav-link padleft35" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                  {{-- <span class="sidebar-mini"> LO </span> --}}
                  <i class="material-icons">power_settings_new</i>
                  <span class="sidebar-normal"> Log Out </span>
                </a>
              </li>
            </ul>
          </div>
        </li>
      </div>
    </ul>
    <ul class="nav">
      <li class="nav-item{{ $activePage == 'dashboard' ? ' active' : '' }}">
        <a class="nav-link" href="{{ route('home') }}">
          <i class="material-icons">dashboard</i>
            <p>{{ __('Dashboard') }}</p>
        </a>
      </li>
      
      @can('manage-users', App\User::class)
      <li class="nav-item {{ ($menuParent == 'laravel') ? ' active' : '' }}" id="admin_collapse">
        <a class="nav-link" data-toggle="collapse" href="#laravelExample" {{ ($menuParent == 'laravel' || $activePage == 'dashboard') ? ' aria-expanded="true"' : '' }}>
          <i class="material-icons">admin_panel_settings</i>
          <p>{{ __('Administrator') }}
            @if(auth()->user()->pending_approval_count() > 0 && auth()->user()->isAdmin())
              <span class="badge badge-pill badge-danger" id="pendingApprovalA">{{ auth()->user()->pending_approval_count() }}</span>
            @endif
            <b id="div_pendingApprovalA" class="caret"></b>
          </p>
        </a>
        <div class="collapse {{ ($menuParent == 'laravel') ? ' show' : '' }}" id="laravelExample">
          <ul class="nav">
            @can('manage-users', App\User::class)
              <li class="nav-item{{ $activePage == 'user-management' ? ' active' : '' }}">
                <a class="nav-link padleft35" href="{{ route('user.index') }}">
                  <span class="sidebar-mini"> UM </span>
                  <span class="sidebar-normal" id="div_pendingApprovalB"> {{ __('User Management') }}
                  @if(auth()->user()->pending_approval_count() > 0 && auth()->user()->isAdmin())
                    <span class="badge badge-pill badge-danger" id="pendingApprovalB">{{ auth()->user()->pending_approval_count() }}</span>
                  @endif
                  </span>
                </a>
              </li>
            @endcan
            @can('manage-holidays', App\User::class)
              <li class="nav-item{{ $activePage == 'holiday-management' ? ' active' : '' }}">
                <a class="nav-link padleft35" href="{{ route('holiday.index') }}">
                  <span class="sidebar-mini"> HM </span>
                  <span class="sidebar-normal"> {{ __('Holiday Management') }}</span>
                </a>
              </li>
            @endcan
            @can('manage-staffs', App\User::class)
              <li class="nav-item{{ $activePage == 'staff-management' ? ' active' : '' }}">
                <a class="nav-link padleft35" href="{{ route('staff.index') }}">
                  <span class="sidebar-mini"> SM </span>
                  <span class="sidebar-normal"> {{ __('Staff Management') }} </span>
                </a>
              </li>
            @endcan

            {{-- @if(auth()->user()->isAdmin())
              <li class="nav-item{{ $activePage == 'position-management' ? ' active' : '' }}">
                <a class="nav-link" href="{{ route('position.index') }}">
                  <span class="sidebar-mini"> PM </span>
                  <span class="sidebar-normal"> {{ __('Position Management') }} </span>
                </a>
              </li>
            @endif --}}
            {{-- @if(auth()->user()->isAdmin())
              <li class="nav-item{{ $activePage == 'organization-management' ? ' active' : '' }}">
                <a class="nav-link" href="{{ route('organization.index') }}">
                  <span class="sidebar-mini"> OM </span>
                  <span class="sidebar-normal"> {{ __('Organization Management') }} </span>
                </a>
              </li>
            @endif --}}
            @can('manage-maincategory', App\User::class)
              <li class="nav-item{{ $activePage == 'maincategory-management' ? ' active' : '' }}">
                <a class="nav-link padleft35" href="{{ route('maincategory.index') }}">
                  <span class="sidebar-mini"> CM </span>
                  <span class="sidebar-normal"> {{ __('Category Management') }} </span>
                </a>
              </li>
            @endcan
            @if(auth()->user()->isAdmin())
              <li class="nav-item{{ $activePage == 'category-management' ? ' active' : '' }}">
                <a class="nav-link padleft35" href="{{ route('category.index') }}">
                  <span class="sidebar-mini"> IT </span>
                  <span class="sidebar-normal"> {{ __('Issue Type') }} </span>
                </a>
              </li>
            @endif
            @can('view-logs', App\User::class)
              <li class="nav-item{{ $activePage == 'view-logs' ? ' active' : '' }}">
                <a class="nav-link padleft35" href="{{ route('view.logs') }}">
                  <span class="sidebar-mini"> SL </span>
                  <span class="sidebar-normal"> {{ __('System Logs') }} </span>
                </a>
              </li>
            @endcan

            @can('view_archive', App\User::class)
              <li class="nav-item{{ $activePage == 'view_archive' ? ' active' : '' }}">
                <a class="nav-link padleft35" href="{{ route('archive.index') }}">
                  <span class="sidebar-mini"> AR </span>
                  <span class="sidebar-normal"> {{ __('Archive') }} </span>
                </a>
              </li>
            @endcan
           
          </ul>
        </div>
      </li>
      @endcan

      <li class="nav-item {{ $menuParent == 'issues' ? ' active' : '' }}" id="request_collapse">
        <a class="nav-link" data-toggle="collapse" href="#requestlnk" {{ $menuParent == 'Issues' ? ' aria-expanded="true"' : '' }}>
          <i class="material-icons">announcement</i>
          <p>{{ __('Requests') }}
            @if(auth()->user()->pendingCount() > 0)
              <span class="badge badge-pill badge-danger" id="issueforActionA">{{ auth()->user()->pendingCount() }}</span>
            @endif
            <b id="div_issueforActionA" class="caret"></b>
          </p>
        </a>
        <div class="collapse {{ $menuParent == 'issues' ? ' show' : '' }}" id="requestlnk">
          <ul class="nav">
            @can('create_issue', App\User::class)
              <li class="nav-item{{ $activePage == 'report-issue' ? ' active' : '' }} ">
                <a class="nav-link padleft35" href="{{ route('issue.create') }}">
                  <span class="sidebar-mini"> CT </span>
                  <span class="sidebar-normal"> {{ __('Create Ticket') }} </span>
                </a>
              </li>
            @endcan
            <li class="nav-item{{ $activePage == 'view-request' ? ' active' : '' }} ">
              <a class="nav-link padleft35" href="{{ route('issue.index') }}">
                <span class="sidebar-mini"> VT </span>
                <span id="div_issueforActionB" class="sidebar-normal"> {{ __('View Tickets') }} 
                  @if(auth()->user()->pendingCount() > 0)
			              <span class="badge badge-pill badge-danger" id="issueforActionB">{{ auth()->user()->pendingCount() }}</span>
                  @endif
                </span>
              </a>
            </li>
          </ul>
        </div>
      </li>







      @can('manage-genreport', App\User::class)
        <li class="nav-item {{ $menuParent == 'reports' ? ' active' : '' }}">
          <a class="nav-link" data-toggle="collapse" href="#reportlnk" {{ $menuParent == 'reports' ? ' aria-expanded="true"' : '' }}>
            <i class="material-icons">description</i>
            <p>{{ __('Reports') }}
              <b id="div_issueforActionA" class="caret"></b>
            </p>
          </a>
          <div class="collapse {{ $menuParent == 'reports' ? ' show' : '' }}" id="reportlnk">
            <ul class="nav">
              <li class="nav-item{{ $activePage == 'monthly-report' ? ' active' : '' }} ">
                <a class="nav-link padleft35" href="#/" onclick="ocShowReportOption(0)">
                  <span class="sidebar-mini"> MR </span>
                  <span class="sidebar-normal"> {{ __('Monthly') }} </span>
                </a>
              </li>
              <li class="nav-item{{ $activePage == 'quarterly-report' ? ' active' : '' }} ">
                <a class="nav-link padleft35" href="#/" onclick="ocShowReportOption(1)">
                  <span class="sidebar-mini"> QR </span>
                  <span id="div_issueforActionB" class="sidebar-normal">{{ __('Quarterly') }}</span>
                </a>
              </li>
              <li class="nav-item{{ $activePage == 'quarterly-report' ? ' active' : '' }} ">
                <a class="nav-link padleft35" href="#/" onclick="ocShowReportOption(2)">
                  <span class="sidebar-mini"> AR </span>
                  <span id="div_issueforActionB" class="sidebar-normal">{{ __('Annual') }}</span>
                </a>
              </li>
            </ul>
          </div>
        </li>
        <div class="modal fade mart-010" tabindex="-1" id="modalReport" role="dialog" aria-labelledby="modalReportTitle" aria-hidden="true" hidden>
          <form method="post" id="frmGenerateRep" enctype="multipart/form-data" action="" autocomplete="off" class="form-horizontal">
            @csrf
            <div class="modal-dialog modal-sm2" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title txtbold" id="modalReportTitle"></h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <div class="row" style="display : flex; align-items : center; justify-content: center;">
                    <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Year : ') }}</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                        <select class="selectpicker col-sm-12" name="year" data-style="select-with-transition" title="" data-size="3">
                          @for($x=date('Y');$x>(date('Y')-5);$x--)
                            <option value="{{ $x }}" @if($x==date('Y')) selected @endif>{{ $x }}</option>
                          @endfor
                        </select>
                      </div>
                    </div>
                  </div>


                  <div class="row" id="divMos" style="display : flex; align-items : center; justify-content: center;">
                    <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Month : ') }}</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                        <select class="selectpicker col-sm-12" name="month" data-style="select-with-transition" title="" data-size="3">
                          @for($x=1;$x<=12;$x++)
                            <option value="{{ $x }}" @if($x==date('n')) selected @endif>{{ date('F', mktime(0, 0, 0, $x, 10)) }}</option>
                          @endfor
                        </select>
                      </div>
                    </div>
                  </div>


                  <div class="row" id="divQtr" style="display : flex; align-items : center; justify-content: center;">
                    <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Quarter : ') }}</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                        <select class="selectpicker col-sm-12" name="quarter" data-style="select-with-transition" title="" data-size="3">
                          @for($x=1;$x<=4;$x++)
                            <option value="{{ $x }}" @if($x==ceil(date("n") / 3)) selected @endif>{{ 'Quater ' . $x  }}</option>
                          @endfor
                        </select>
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="modal-footer ml-auto mr-auto">
                      <button type="submit" class="btn btn-primary">Generate</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
      @endcan
    </ul>
  </div>
  @if (empty(auth()->user()->picture))
    <div class="modal fade mart-010" tabindex="-1" id="modalProfile" role="dialog" aria-labelledby="modalProfileTitle" aria-hidden="true" hidden>
      <form method="post" id="frmUpdateProfile" enctype="multipart/form-data" action="{{ route('profile.update_photo') }}" autocomplete="off" class="form-horizontal frm-prevent-multiple-submit">
        @csrf
        @method('put')
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Update Profile Photo</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row ml-auto mr-auto text-center">
                <div class="col-sm-12">
                  <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                    <div class="fileinput-new thumbnail img-circle" style="width:100px; height:100px;overflow: hidden;">
                      <img src="{{ asset('material') }}/img/default-avatar.png" alt="..." style="max-width: 100px;"/>
                    </div>
                    <div class="fileinput-preview fileinput-exists thumbnail img-circle" style="width:100px; height:100px;overflow: hidden;"></div>
                    <div>
                      <span class="btn btn-info btn-file btn-link txtinit" id="btnSelectFile">
                        <span class="fileinput-new">
                          <i class="material-icons">edit</i> Edit
                        </span>
                        <span class="fileinput-exists">
                          <i class="fa fa-refresh"></i> Change
                        </span>
                        <input type="file" name="photoModalX" id="input-pictureX" />
                      </span>
                      <a href="#pablo" class="btn btn-danger btn-link fileinput-exists txtinit" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
                    </div>
                    @include('alerts.feedback', ['field' => 'photoModalX'])
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer ml-auto mr-auto">
              <button type="submit" class="btn btn-info btn-prevent-multiple-submit">Update</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  @endif

</div>


@push('js')
<script>
  $(document).ready(function() {
    var pusher = new Pusher('f06c97a0aef2e6918f72', {
      cluster: 'ap2'
    });

    var channel = pusher.subscribe('my-channel');
    channel.bind('my-event', function(data) {
      // findIndex(
      let findID = data.ids.findIndex(obj => obj.id == parseInt({!! auth()->user()->id !!}));
      if (findID != -1) {
        let myData = data.ids[findID];
        if (data.type == 'new_registered_user') {
          let m_cnt = parseInt(myData.value);
          if ($('#pendingApprovalA').length) {
            if (m_cnt > 0) {
              $('#pendingApprovalA').text(m_cnt);
              $('#pendingApprovalB').text(m_cnt);
              $('#pendingApprovalA').show();
              $('#pendingApprovalB').show();
            } else {
              $('#pendingApprovalA').hide();
              $('#pendingApprovalB').hide();
            }
          } else {
            $('<span class="badge badge-pill badge-danger" id="pendingApprovalA">' + m_cnt + '</span>').insertBefore("#div_pendingApprovalA");
            $("#div_pendingApprovalB").append('<span class="badge badge-pill badge-danger" id="pendingApprovalB">' + m_cnt + '</span>');
            if (m_cnt < 1) {
              $('#pendingApprovalA').hide();
              $('#pendingApprovalB').hide();
            }
          }
          if ($('#laravelExample').is( ":visible" )) {
            $('#pendingApprovalA').hide();
          }
        } else if (data.type == 'issue_for_action') {
          let m_cnt = parseInt(myData.value);
          if ($('#issueforActionA').length) {
            if (m_cnt > 0) {
              $('#issueforActionA').text(m_cnt);
              $('#issueforActionB').text(m_cnt);
              $('#issueforActionA').show();
              $('#issueforActionB').show();
            } else {
              $('#issueforActionA').hide();
              $('#issueforActionB').hide();
            }
          } else {
            $('<span class="badge badge-pill badge-danger" id="issueforActionA">' + m_cnt + '</span>').insertBefore("#div_issueforActionA");
            $("#div_issueforActionB").append('<span class="badge badge-pill badge-danger" id="issueforActionB">' + m_cnt + '</span>');
            if (m_cnt < 1) {
              $('#issueforActionA').hide();
              $('#issueforActionB').hide();
            }
          }
          if ($('#requestlnk').is( ":visible" )) {
            $('#issueforActionA').hide();
          }
        }
      }
    });
  });

  


  $('#admin_collapse').on('shown.bs.collapse', function () {
    $('#pendingApprovalA').hide();
  })
  $('#admin_collapse').on('hidden.bs.collapse', function () {
    $('#pendingApprovalA').show();
  })

  $('#request_collapse').on('shown.bs.collapse', function () {
    $('#issueforActionA').hide();
  })
  $('#request_collapse').on('hidden.bs.collapse', function () {
    $('#issueforActionA').show();
  })

  function ocShowReportOption(myID = 0) {
    if (myID == 0) {
      document.getElementById('modalReport').hidden = false;
      $('#modalReport').appendTo("body").modal('show');
      $('#modalReportTitle').text('Monthly Report');
      document.getElementById('divQtr').hidden = true;
      document.getElementById('divMos').hidden = false;
      $("#frmGenerateRep").attr('action', '/generatereport/monthly');
    } else if(myID == 1) {
      document.getElementById('modalReport').hidden = false;
      $('#modalReport').appendTo("body").modal('show');
      $('#modalReportTitle').text('Quarterly Report');
      document.getElementById('divQtr').hidden = false;
      document.getElementById('divMos').hidden = true;
      $("#frmGenerateRep").attr('action', '/generatereport/quarterly');
    } else {
      document.getElementById('modalReport').hidden = false;
      $('#modalReport').appendTo("body").modal('show');
      $('#modalReportTitle').text('Annual Report');
      document.getElementById('divQtr').hidden = true;
      document.getElementById('divMos').hidden = true;
      $("#frmGenerateRep").attr('action', '/generatereport/annual');
    }
  }
    
  function ocShowProfileModal() {
    if (document.getElementById('modalProfile')) {
      document.getElementById('modalProfile').hidden = false;
      // $('#modalProfile').appendTo("body").modal('show');
      $('#modalProfile').appendTo("body") 
      $("#modalProfile").modal("show");
      $("#input-pictureX").trigger("click");
    }
  }

  $('.frm-prevent-multiple-submit').on('submit', function() {
    $('.btn-prevent-multiple-submit').attr('disabled', true);
    $("#CssLoader").attr("hidden", false);
  });
</script>
@endpush