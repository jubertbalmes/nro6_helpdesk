@extends('layouts.app', ['activePage' => 'user-management', 'menuParent' => 'laravel', 'titlePage' => __('User Management')])

@section('content')

  <div class="content rempm">
    <div class="container-fluid">
      <div class="row">

        <div id="CssLoader">
          <div class='spinftw'></div>
        </div>


        <div class="col-md-12">
              <div class="card mb-8">
                <div class="card-header card-header-rose card-neda">
                  <div class="card-body">
                    <div class="row">
                      <i class="material-icons">group</i>
                      <h4 class="card-titleX">{{ __('Users') }}</h4>
                    </div>
                  </div>
                </div>
              <div class="card-body">
                @can('create', App\User::class)
                  <div class="row">
                    <div class="col-12 text-right">
                      <a href="{{ route('user.create') }}" class="btn btn-sm btn-info">{{ __('Add user') }}</a>
                    </div>
                  </div>
                @endcan
                <div class="table-responsive">
                  <table id="datatables" class="table table-striped table-no-bordered table-hover" style="display:none">
                    <thead class="text-primary">
                      <th class="desktop">
                          {{ __('Photo') }}
                      </th>
                      <th class="desktop">
                          {{ __('Name') }}
                      </th>
                      <th class="desktop">
                        {{ __('') }}
                      </th>
                      <th class="desktop">
                        {{ __('Email') }}
                      </th>
                      <th class="desktop">
                        {{ __('Role') }}
                      </th>
                      <th class="desktop">
                        {{ __('Creation date') }}
                      </th>
                      @can('view_status', App\User::class)
                        <th class="text-center desktop">
                          {{ __('Status') }}
                        </th>
                      @endcan
                      @can('perform_actions', App\User::class)
                        <th class="text-center desktop">
                          {{ __('Actions') }}
                        </th>
                      @endcan
                    </thead>
                    <tbody>
                      @foreach($users as $user)
                        @can('view', $user)
                          <tr>
                            <td>
                              <div class="avatar avatar-sm rounded-circle img-circle" style="width:50px; height:50px;overflow: hidden;">
                                  <img src="{{ $user->profilePicture() }}" alt="" style="max-width: 50px;">
                              </div>
                            </td>
                            <td>
                              {{ $user->name }}
                            </td>
                            <td>
                              @can('approve', $user)
                                @if ($user->status == 0)
                                  {{-- <a rel="tooltip" class="btn btn-danger btn-link btn-sm" href="#" data-original-title="" title="">
                                    <i class="material-icons">notifications</i>
                                  </a> --}}
                                  <a rel="tooltip" class="btn-link btn-sm">
                                    <i class="fa fa-exclamation text-danger" aria-hidden="true"></i>
                                  </a>
                                @endif
                              @endcan
                            </td>
                            <td>
                              {{ $user->email }}
                            </td>
                            <td>
                              {{ $user->role->name }}
                            </td>
                            <td>
                              {{ $user->created_at->format('Y-m-d g:i:s A') }}
                            </td>
                            @can('view_status', App\User::class)
                              <td class="text-center">
                                @if ($user->status == 0)
                                  <span class="text-info"><i title="For Approval" class="fa fa-circle"></i></span> 
                                @elseif ($user->status == 3)
                                  <span style="color: red;"><i title="Rejected" class="fa fa-circle"></i></span> 
                                  {{-- @can('approve', App\User::class)
                                    <a class="fs-info" href="{{ route('approve', encrypt($user->id)) }}">
                                      <span class="text-info"><i data-toggle="tooltip" title="Approve" class="fa fa-thumbs-up"></i></span>
                                    </a>
                                  @else
                                    <span class="text-info"><i class="fa fa-circle"></i></span>
                                  @endcan --}}
                                @elseif ($user->status == 1)
                                  <span style="color: #09b826;" ><i title="Active" class="fa fa-circle"></i></span>
                                  {{-- @can('activate', $user)
                                    @if ($user->id != auth()->id())
                                      <a class="fs-success" href="{{ route('active_inactive', $user->id) }}">
                                        <span style="color: #09b826;" ><i data-toggle="tooltip" title="Switch to inactive" class="fa fa-refresh"></i></span>
                                      </a>
                                    @else
                                      <span style="color: #09b826;" ><i class="fa fa-circle"></i></span>
                                    @endif
                                  @else
                                    <span style="color: #09b826;" ><i class="fa fa-circle"></i></span>
                                  @endcan --}}
                                @else
                                  <span style="color: gray;" ><i title="Inactive" class="fa fa-circle"></i></span>
                                  {{-- @can('activate', $user)
                                    @if ($user->id != auth()->id())
                                      <a class="fs-danger" href="{{ route('active_inactive', $user->id) }}">
                                        <span style="color: gray;" ><i data-toggle="tooltip" title="Switch to active" class="fa fa-refresh"></i></span>
                                      </a>
                                    @else
                                      <span style="color: gray;" ><i class="fa fa-circle"></i></span>
                                    @endif
                                  @else
                                    <span style="color: gray;" ><i class="fa fa-circle"></i></span>
                                  @endcan --}}
                                @endif
                              </td>
                            @endcan
                            @can('perform_actions', App\User::class)
                              <td class="td-actions text-center">
                                @if ($user->id != auth()->id())
                                  <form action="{{ route('user.destroy', $user) }}" method="post">
                                      @csrf
                                      @method('delete')

                                      @can('approve', $user)
                                        <a rel="tooltip" class="btn btn-info btn-link" href="{{ route('approve', encrypt($user->id)) }}" data-original-title="" title="">
                                          <i data-toggle="tooltip" title="Approve" class="fa fa-thumbs-up"></i>
                                          <div class="ripple-container"></div>
                                        </a>
                                        <a rel="tooltip" class="btn btn-danger btn-link" href="{{ route('reject', encrypt($user->id)) }}" data-original-title="" title="">
                                          <i data-toggle="tooltip" title="Reject" class="fa fa-thumbs-down"></i>
                                          <div class="ripple-container"></div>
                                        </a>
                                      @endcan



                                      @can('activate', $user)
                                        @if ($user->status == 1 || $user->status == 2)
                                          <a rel="tooltip" class="btn btn-warning btn-link" href="{{ route('active_inactive', $user->id) }}" onclick="return ocshowloading();" data-original-title="" title="">
                                            <i data-toggle="tooltip" title="@if($user->status == 1) Switch to inactive @else Switch to active @endif" class="fa fa-refresh"></i>
                                            <div class="ripple-container"></div>
                                          </a>
                                        @endif
                                      @endcan
                                      @can('update', $user)
                                        <a rel="tooltip" class="btn btn-success btn-link" href="{{ route('user.edit', $user) }}" data-original-title="" title="">
                                          <i data-toggle="tooltip" title="Edit" class="material-icons">edit</i>
                                          <div class="ripple-container"></div>
                                        </a>
                                      @endcan
                                      @can('delete', $user)
                                        <button type="button" class="btn btn-danger btn-link" data-original-title="" title="" onclick="confirm('{{ __("Are you sure you want to delete this user?") }}') ? this.parentElement.submit() : ''">
                                            <i data-toggle="tooltip" title="Delete/Reject" class="material-icons">close</i>
                                            <div class="ripple-container"></div>
                                        </button>
                                      @endcan
                                  </form>
                                @else
                                  @can('update', $user)
                                    <a rel="tooltip" class="btn btn-success btn-link" href="{{ route('profile.edit') }}" data-original-title="" title="">
                                      <i title="Edit" class="material-icons">edit</i>
                                      <div class="ripple-container"></div>
                                    </a>
                                  @endcan
                                @endif
                              </td>
                            @endcan
                          </tr>
                        @endcan
                      @endforeach
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>
  </div>
@endsection

@push('js')
  <script>
    $(document).ready(function() {
      @if ($errors->has('with_attached_item'))
        $.notify({
          icon: "close",
          message: "{{ $errors->first('with_attached_item') }}"
        }, {
          type: 'danger',
          timer: 3000,
          placement: {
            from: 'top',
            align: 'right'
          }
        });
      @elseif ($errors->has('error_message'))
        $.notify({
          icon: "close",
          message: "{{ $errors->first('error_message') }}"
        }, {
          type: 'danger',
          timer: 3000,
          placement: {
            from: 'top',
            align: 'right'
          }
        });
      @endif


      $('#pendingApprovalA').hide();
      $('#datatables').fadeIn(1100);
      $('#datatables').DataTable({
        "order": [[5, 'desc']],
        "pagingType": "full_numbers",
        "lengthMenu": [
          [10, 25, 50, -1],
          [10, 25, 50, "All"]
        ],
        responsive: false,
        language: {
          search: "_INPUT_",
          searchPlaceholder: "Search users",
        },
        "columnDefs": [
          { "orderable": false, "targets": [2, 7] },
        ],
      });
    });

    function ocshowloading() {
      $("#CssLoader").attr("hidden", false);
      return true;
    }
  </script>
@endpush